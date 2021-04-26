//
//  IpcDataSource.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation
import RxSwift
import RxCocoa

class IpcDataSource {
    var ipcData = BehaviorRelay<[IpcDataModel]>(value: [])
    private let disposeBag = DisposeBag()
    private var presenter: IpcPresenterProtocol
    
    init(presenter: IpcPresenterProtocol) {
        self.presenter = presenter
        setupBinding()
    }
    
    func setupBinding() {
        presenter.actionObservable
            .filter { $0 != .ipcFailed }
            .subscribe(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.ipcData
                    .accept(self.presenter.ipcResult.map { $0.dataModel() })
            }).disposed(by: disposeBag)
    }
}
