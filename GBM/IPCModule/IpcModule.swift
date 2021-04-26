//
//  IpcModule.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit

class IpcModule {
    private var presenter: IpcPresenterProtocol
    
    init() {
        let interactor = IpcInteractor()
        let wireframe = IpcWireframe()
        presenter = IpcPresenter(interactor: interactor,
                                 wireframe: wireframe)
    }
}

extension IpcModule: IpcModuleProtocol {
    func show(vc: UINavigationController) {
        presenter.show(vc: vc)
    }
}
