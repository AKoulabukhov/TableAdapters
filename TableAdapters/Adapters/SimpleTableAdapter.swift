//
//  OneToOneTableAdapter.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 10/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class SimpleTableAdapter<Cell: TableAdapterCell>: NSObject, TableAdapter {
    
    let cellTypes: [ReusableCell.Type] = [Cell.self]
    var items = [Cell.Item]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! Cell).configure(with: self.items[indexPath.row])
    }
    
}
