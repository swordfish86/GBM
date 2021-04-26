//
//  LoginProtocols.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit

protocol LoginPresenterProtocol {
    var rootController: UIViewController { get }
    func authenticate()
}
protocol LoginWireframeProtocol {
    var rootController: UINavigationController { get }
    
    func showAuthenticateFailed()
    func moveForward()
    func buildController(presenter: LoginPresenterProtocol)
}
protocol LoginInteractorProtocol {
    func authenticate(completion: @escaping (AuthenticationState) -> Void)
}
protocol LoginModuleProtocol {
    var rootController: UIViewController { get }
}
