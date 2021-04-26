//
//  IpcWireframeSpy.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import UIKit
@testable import GBM

class IpcWireframeSpy: IpcWireframeProtocol {
    var showed = false
    
    func show(vc: UINavigationController, presenter: IpcPresenterProtocol) {
        showed = true
    }
}
