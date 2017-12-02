//
//  HeaderView.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 14/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView, Configurable {
    
    let label = UILabel()
    
    func configure(with item: String) {
        if label.superview == nil { self.addSubview(label); label.frame = self.bounds; label.autoresizingMask = [.flexibleWidth, .flexibleHeight] }
        label.text = item
    }
    
}
