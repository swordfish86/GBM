//
//  IpcProtocols.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit
import RxSwift

protocol IpcPresenterProtocol {
    var ipcResult: [IpcResult] { get }
    var actionObservable: Observable<ActionResponse> { get }
    func handle(action: IpcAction)
    func show(vc: UINavigationController)
}
protocol IpcWireframeProtocol {
    func show(vc: UINavigationController, presenter: IpcPresenterProtocol)
}
protocol IpcInteractorProtocol {
    var ipcResult: [IpcResult] { get }
    var timeInterval: Int { get }
    var actionObservable: Observable<ActionResponse> { get }
    var ipcLoaderDisposable: Disposable? { get set }
    func loadIpc()
    func stopIpc() 
}
protocol IpcModuleProtocol {
    func show(vc: UINavigationController)
}
