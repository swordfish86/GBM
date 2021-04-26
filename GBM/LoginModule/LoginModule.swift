//
//  LoginModule.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit

class LoginModule {
    private var presenter: LoginPresenterProtocol
    
    init() {
        let interactor = LoginInteractor()
        let wireframe = LoginWireframe()
        presenter = LoginPresenter(interactor: interactor,
                                   wireframe: wireframe)
    }
}

extension LoginModule: LoginModuleProtocol {
    var rootController: UIViewController {
        presenter.rootController
    }    
}
