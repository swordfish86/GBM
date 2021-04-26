//
//  IpcEntity.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import Foundation

class IpcResult: Codable {
    static let formatter = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    var date: String
    var price: Float
    var percentageChange: Float
    var volume: Float
    var change: Float
    
    init(date: String,
         price: Float,
         percentageChange: Float,
         volume: Float,
         change: Float) {
        self.date = date
        self.price = price
        self.percentageChange = percentageChange
        self.volume = volume
        self.change = change
    }
    
    func dataModel() -> IpcDataModel {
        IpcDataModel(date: date,
                     price: price,
                     percentageChange: percentageChange)
    }
}

struct IpcDataModel {
    private let formatter = "yyyy-MM-dd"
    private var date: Date?
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        guard let date = date else { return "" }
        return dateFormatter.string(from: date)
    }
    var price: String
    var percentageChange: String
    
    init(date: String, price: Float, percentageChange: Float) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = IpcResult.formatter
        self.date = dateFormatter.date(from: date)
        self.price = String.init(format: "$%.2f", price)
        self.percentageChange = String.init(format: "%.2f%%", percentageChange * 100)
    }
}
