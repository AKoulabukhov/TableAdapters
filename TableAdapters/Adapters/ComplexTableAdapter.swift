//
//  ComplexTableAdapter.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 14/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

// TO BE DONE

class ComplexTableAdapter: NSObject, TableAdapter {
    
    var data = [SectionConfiguration<UIView, UITableViewCell & ReusableCell>]()
    
    var cellTypes: [ReusableCell.Type] {
        return data.flatMap { $0.items }
            .map { type(of: $0) }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.section].items[indexPath.row]
    }
    
}
