//
//  LoginWireframeSpy.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import UIKit
@testable import GBM

class LoginWireframeSpy: LoginWireframeProtocol {
    var rootController = UINavigationController()
    var authenticationFailed = false
    var movedForward = false
    var buildedController = false
    
    func showAuthenticateFailed() {
        authenticationFailed = true
    }
    
    func moveForward() {
        movedForward = true
    }
    
    func buildController(presenter: LoginPresenterProtocol) {
        buildedController = true
    }
}
