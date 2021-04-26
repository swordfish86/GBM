//
//  LoginWireframe.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit

class LoginWireframe: LoginWireframeProtocol {
    
    private var viewController: LoginViewController?
    lazy var rootController = UINavigationController()
    
    init() {}
    
    func showAuthenticateFailed() {
        let alert = UIAlertController(title: LanguageString.faceIdTitle.localized,
                                      message: LanguageString.faceIdFailedMessage.localized,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LanguageString.accept.localized,
                                      style: .default,
                                      handler: nil))
        viewController?.present(alert, animated: true, completion: nil)
    }
    
    func buildController(presenter: LoginPresenterProtocol) {
        let vc = LoginViewController(presenter: presenter)
        rootController.pushViewController(vc, animated: true)
        viewController = vc
    }
    
    func moveForward() {
        let ipcModule = IpcModule()
        ipcModule.show(vc: rootController)
    }
}
