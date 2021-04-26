//
//  IpcViewController.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class IpcViewController: UIViewController {
    
    @IBOutlet private weak var ipcTableData: UITableView!
    private var dataSource: IpcDataSource?
    private var presenter: IpcPresenterProtocol
    private let disposeBag = DisposeBag()
    
    init(presenter: IpcPresenterProtocol) {
        self.presenter = presenter
        dataSource = IpcDataSource(presenter: presenter)
        let nibName = String(describing: IpcViewController.self)
        super.init(nibName: nibName, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        presenter.handle(action: .loadIpc)
        setupBinding()
    }
    
    func registerCell() {
        let nib = UINib(nibName: IpcDataCell.reuseIdentifier, bundle: nil)
        ipcTableData.register(nib, forCellReuseIdentifier: IpcDataCell.reuseIdentifier)
    }
    
    func setupBinding() {
        dataSource?.ipcData
            .bind(to: ipcTableData
                    .rx.items(cellIdentifier: IpcDataCell.reuseIdentifier,
                              cellType: IpcDataCell.self)) { index, model, cell in
              cell.update(dataModel: model)
         }.disposed(by: self.disposeBag)
    }
}
