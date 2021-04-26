//
//  StringExtension.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 24/04/21.
//

import Foundation

extension String {
    public func localized() ->  String{
        return NSLocalizedString(self, comment: "")
    }
    
    public func localized(format: CVarArg...) ->  String{
        return String(format: NSLocalizedString(self, comment: ""), format)
    }
}
