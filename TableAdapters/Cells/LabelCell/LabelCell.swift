//
//  StringConfigurableCell.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 11/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class LabelCell: UITableViewCell, TableAdapterCell {
    
    @IBOutlet weak var label: UILabel!
    
    func configure(with item: String) {
        self.label.text = item
    }
    
    struct ComplexDisplayItem {
        let title: String
        let subtitle: String
        let imageUrl: URL?
        let accessoryImage: UIImage
    }
    
}
