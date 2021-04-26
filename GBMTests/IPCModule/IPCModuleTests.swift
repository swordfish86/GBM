//
//  IPCModuleTests.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation
import OHHTTPStubs
import XCTest
import RxSwift

@testable import GBM

class IPCModuleTests: XCTestCase {
    let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
    }
    
    func testPresenter() {
        
        let wireframe = IpcWireframeSpy()
        let interactor = IpcInteractorSpy()
        let presenter = IpcPresenter(interactor: interactor,
                                     wireframe: wireframe)
        XCTAssertTrue(!presenter.ipcResult.isEmpty,
                      "ipcResult should not be empty")
        presenter.show(vc: UINavigationController())
        XCTAssertTrue(wireframe.showed,
                      "module Ipc shpuld be showed")
        
        let expectation = self.expectation(description: "should response to loadIpc")
        interactor.ipcActionResponse = .ipcResponse
        presenter.actionObservable
            .subscribe(onNext: { action in
                XCTAssertTrue(action == .ipcResponse,
                              "loadIpc should succed")
                expectation.fulfill()
            }).disposed(by: disposeBag)
        presenter.handle(action: .loadIpc)
        waitForExpectations(timeout: 3, handler: nil)
    }
    
    func testInteractor() {
        let interactor = IpcInteractor()
        XCTAssertTrue(interactor.timeInterval == IpcInteractor.defaultInterval,
                      "timeInterval was changed")
        guard let stubPath = OHPathForFile("ipc.json", type(of: self)) else {
            XCTFail("ipc mock file was removed")
            return
        }
        stub(condition: pathStartsWith(UrlString.ipcData.rawValue)) { _ in
            return fixture(filePath: stubPath, status: 200, headers: ["Content-Type":"application/json"])
        }
        let expectation = self.expectation(description: "loadIpc should response")
        interactor.actionObservable
            .subscribe(onNext: { action in
                XCTAssertTrue(action == .ipcResponse,
                              "Ipc should succed")
                expectation.fulfill()
            }).disposed(by: disposeBag)
        interactor.loadIpc()
        waitForExpectations(timeout: 30, handler: nil)
        interactor.stopIpc()
        XCTAssertNil(interactor.ipcLoaderDisposable,
                    "ipcLoaderDisposable should be nil ipc was stopped")
        HTTPStubs.removeAllStubs()
    }
}


