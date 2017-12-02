//
//  SectionableTableAdapter.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 13/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

struct SectionConfiguration<HeaderItem, CellItem> {
    let headerItem: HeaderItem
    let items: [CellItem]
}

typealias HeaderViewProtocol = UIView & Configurable

class SectionableTableAdapter<Cell: TableAdapterCell, HeaderView: HeaderViewProtocol>: NSObject, TableAdapter {
    
    var cellTypes: [ReusableCell.Type] = [Cell.self]
    var data = [SectionConfiguration<HeaderView.Item, Cell.Item>]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! Cell).configure(with: self.data[indexPath.section].items[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = HeaderView()
        view.configure(with: data[section].headerItem)
        return view
    }
    
}
