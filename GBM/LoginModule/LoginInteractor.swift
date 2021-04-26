//
//  LoginInteractor.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import Foundation

class LoginInteractor {
    private let auteticationManager = SecurityBiometricManager()
    
    init() { }
}

extension LoginInteractor: LoginInteractorProtocol {
    func authenticate(completion: @escaping (AuthenticationState) -> Void) {
        auteticationManager.requestBiometrics(completion: completion)
    }
}
