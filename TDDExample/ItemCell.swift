//
//  ItemCellTableViewCell.swift
//  TDDExample
//
//  Created by KwameBryan on 2017-01-25.
//  Copyright © 2017 KwameBryan. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel:UILabel!
    
    @IBOutlet weak var labelLocation: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    lazy var dateFormatter:DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            return dateFormatter
    }()
    
    func configCell(with item:ToDoItem) {
        self.titleLabel.text = item.title
        self.labelLocation.text = item.location?.name
        
        if let timeStamp = item.timestamp {
            let date = Date(timeIntervalSince1970: timeStamp)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            
            self.dateLabel.text = dateFormatter.string(from: date)
        }
    }
}
