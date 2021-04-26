//
//  IpcDataCell.swift
//  GBM
//
//  Created by Jorge Angel Sanchez Martinez on 25/04/21.
//

import UIKit

class IpcDataCell: UITableViewCell {
    static let reuseIdentifier = "IpcDataCell"
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var percentageChangeLabel: UILabel!
    
    func update(dataModel: IpcDataModel) {
        dateLabel.text = dataModel.dateString
        priceLabel.text = dataModel.price
        percentageChangeLabel.text = dataModel.percentageChange
    }
}
