//
//  LoginInteractorSpy.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation
@testable import GBM

class LoginInteractorSpy: LoginInteractorProtocol {
    var state: AuthenticationState = .noAuth
    func authenticate(completion: @escaping (AuthenticationState) -> Void) {
        completion(state)
    }
}
