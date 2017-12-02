//
//  TableAdapterCell.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 10/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

protocol ReusableCell {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

protocol Configurable {
    associatedtype Item
    func configure(with item: Item)
}

extension ReusableCell where Self: UITableViewCell {
    static var reuseIdentifier: String { return String(describing: self) }
    static var nib: UINib { return UINib(nibName: reuseIdentifier, bundle: nil) }
}

typealias TableAdapterCell = ReusableCell & Configurable
