//
//  IpcInteractor.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import Foundation
import RxSwift
enum ActionResponse {
    case ipcFailed
    case ipcResponse
}

class IpcInteractor {
    static let defaultInterval = 5
    var ipcLoaderDisposable: Disposable?
    var ipcResult: [IpcResult] = []
    private var actionResponseSubject = PublishSubject<ActionResponse>()
}

extension IpcInteractor: IpcInteractorProtocol {
    
    var timeInterval: Int {
        IpcInteractor.defaultInterval
    }
    var actionObservable: Observable<ActionResponse> {
        actionResponseSubject
    }
    
    func stopIpc() {
        ipcLoaderDisposable?.dispose()
        ipcLoaderDisposable = nil
    }
    
    func loadIpc() {
        ipcLoaderDisposable = Observable<Int>
            .timer(.seconds(0),
                   period: .seconds(timeInterval),
                   scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] time in
                self?.callIpcData()
            })
    }
    
    private func callIpcData() {
        ConnectionManager.request(from: UrlString.ipcData.rawValue) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .failure:
                self.actionResponseSubject.onNext(.ipcFailed)
            case .success(let data):
                let decoder = JSONDecoder()
                let result: [IpcResult] = (try? decoder.decode([IpcResult].self, from: data)) ?? []
                self.ipcResult = result
                self.actionResponseSubject.onNext(.ipcResponse)
            }
        }
    }
}

