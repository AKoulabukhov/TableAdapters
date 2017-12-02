//
//  TableAdapter.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 10/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

protocol ReusableCellTypesProvider {
    var cellTypes: [ReusableCell.Type] { get }
}

protocol TableViewAttachable {
    func onAttach(to tableView: UITableView)
}

extension TableViewAttachable {
    func onAttach(to tableView: UITableView) { }
}

typealias TableAdapter = UITableViewDataSource & UITableViewDelegate & ReusableCellTypesProvider & TableViewAttachable

extension UITableView {
    func setAdapter(_ adapter: TableAdapter) {
        self.dataSource = adapter
        self.delegate = adapter
        adapter.cellTypes.forEach { self.register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier) }
        adapter.onAttach(to: self)
    }
}
