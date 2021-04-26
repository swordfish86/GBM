//
//  IpcResultMock.swift
//  GBMTests
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation
@testable import GBM

extension IpcResult {
    
    class func mock() -> IpcResult {
        return IpcResult(date: "2020-08-18T00:01:43.633-05:00",
                         price: 39285.85,
                         percentageChange: 0.86257,
                         volume: 128684937,
                         change: 335.97)
        
    }
}
