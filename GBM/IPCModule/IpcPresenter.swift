//
//  IpcPresenter.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit
import RxSwift

enum IpcAction {
    case loadIpc
    case stopLoadIpc
}

class IpcPresenter {
    private var interactor: IpcInteractorProtocol
    private var wireframe: IpcWireframeProtocol
    private let disposeBag = DisposeBag()
    
    init(interactor: IpcInteractorProtocol,
         wireframe: IpcWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func handle(action: IpcAction) {
        switch action {
        case .loadIpc:
            handleLoadIpc()
        case .stopLoadIpc:
            handleStopLoadIpc()
        }
    }
}

extension IpcPresenter: IpcPresenterProtocol {
    var ipcResult: [IpcResult] {
        interactor.ipcResult
    }
    
    var actionObservable: Observable<ActionResponse> {
        interactor.actionObservable
    }
    
    func show(vc: UINavigationController) {
        wireframe.show(vc: vc, presenter: self)
    }
}

private extension IpcPresenter {
    func handleStopLoadIpc() {
        interactor.stopIpc()
    }
    
    func handleLoadIpc() {
        interactor.loadIpc()
    }
}
