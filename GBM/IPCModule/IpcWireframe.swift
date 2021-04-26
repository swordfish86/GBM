//
//  IpcWireframe.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit

class IpcWireframe {
    private weak var rootController: UINavigationController?
}

extension IpcWireframe: IpcWireframeProtocol {
    func show(vc: UINavigationController, presenter: IpcPresenterProtocol) {
        rootController = vc
        let ipcViewController = IpcViewController(presenter: presenter)
        rootController?.pushViewController(ipcViewController, animated: true)
    }
}
