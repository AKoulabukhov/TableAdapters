//
//  StringConfigurableCell.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 11/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class FRCCell: UITableViewCell, TableAdapterCell {
    
    @IBOutlet weak var label: UILabel!
    
    func configure(with item: StringWrapper) {
        self.label.text = item.string
    }
    
}
