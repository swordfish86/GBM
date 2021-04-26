//
//  LoginPresenter.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//
import UIKit

class LoginPresenter {
    private var interactor: LoginInteractorProtocol
    private var wireframe: LoginWireframeProtocol
    
    init(interactor: LoginInteractorProtocol,
         wireframe: LoginWireframeProtocol) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    var rootController: UIViewController {
        wireframe.buildController(presenter: self)
        return wireframe.rootController
    }
    
    func authenticate() {
        interactor.authenticate { [weak self] state in
            switch state {
            case .loggInFail:
                self?.wireframe.showAuthenticateFailed()
            default:
                self?.wireframe.moveForward()
            }
        }
    }
}
