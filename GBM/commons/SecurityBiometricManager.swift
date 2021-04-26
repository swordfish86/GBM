//
//  SecurityBiometricManager.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import Foundation
import LocalAuthentication

enum AuthenticationState {
    case loggIn, loggInFail, noAuth
}

class SecurityBiometricManager {
    let context = LAContext()
    private var state: AuthenticationState = .noAuth
    
    func requestBiometrics(completion: @escaping(AuthenticationState) -> Void) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = LanguageString.reasonBiometrics.localized
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: reason) { [weak self] success, policyError in
                self?.state = success ? .loggIn : .loggInFail
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    completion(self.state)
                }
            }
        } else {
            state = .noAuth
            completion(state)
        }
    }
}
