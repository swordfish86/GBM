//
//  IpcPresenterSpy.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation
import RxSwift
@testable import GBM

class IpcInteractorSpy: IpcInteractorProtocol {
    var ipcLoaderDisposable: Disposable?
    var ipcResult: [IpcResult] = Array(repeating: IpcResult.mock(), count: 5)
    var ipcActionResponse: ActionResponse = .ipcFailed
    var timeInterval: Int = 5
    var actionObservable: Observable<ActionResponse> = .just(.ipcResponse)
    private var actionResponseSubject = PublishSubject<ActionResponse>()
    
    func loadIpc() {
        actionResponseSubject.onNext(ipcActionResponse)
    }
    
    func stopIpc() {
        ipcLoaderDisposable?.dispose()
        ipcLoaderDisposable = nil
    }
}
