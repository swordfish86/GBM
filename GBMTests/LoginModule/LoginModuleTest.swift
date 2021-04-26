//
//  LoginModuleTest.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import XCTest
@testable import GBM

class LoginModuleTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    func testLoginModule() {
        let module = LoginModule()
        XCTAssertTrue(module.rootController is UINavigationController,
                      "root controller must be of type UINavigationController")
    }
    
    func testPresenter() {
        let wireframe = LoginWireframeSpy()
        let interactor = LoginInteractorSpy()
        let presenter = LoginPresenter(interactor: interactor,
                                       wireframe: wireframe)
        interactor.state = .loggIn
        presenter.authenticate()
        XCTAssertTrue(wireframe.movedForward,
                      "if state of FaceId is loggIn should move forward")
        interactor.state = .loggInFail
        presenter.authenticate()
        XCTAssertTrue(wireframe.authenticationFailed,
                      "if state of FaceId is loggInFail authentication should fail")
        
        interactor.state = .noAuth
        presenter.authenticate()
        XCTAssertTrue(wireframe.movedForward,
                      "if state of FaceId is noAuth should move forward")
        
    }
    
    func testInteractor() {
        let expectation = self.expectation(description: "Authentication should response before 20 seconds")
        let interactor = LoginInteractor()
        interactor.authenticate { state in
            expectation.fulfill()
            XCTAssertEqual(state, .loggInFail, "Authentication should fail")
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
}

