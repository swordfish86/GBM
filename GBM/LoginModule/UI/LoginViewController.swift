//
//  LoginViewController.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewController: UIViewController {
    @IBOutlet private weak var retryButton: UIButton!
    private var presenter: LoginPresenterProtocol
    private let disposeBag = DisposeBag()
    
    init(presenter: LoginPresenterProtocol) {
        self.presenter = presenter
        let nibName = String(describing: LoginViewController.self)
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.authenticate()
        retryButton
            .rx.tap
            .asDriver()
            .throttle(.milliseconds(300))
            .drive(onNext: { [weak self] in
                self?.presenter.authenticate()
            }).disposed(by: disposeBag)
    }
}
