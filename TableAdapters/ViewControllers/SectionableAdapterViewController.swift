//
//  SectionableAdapterViewController.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 02/12/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class SectionableAdapterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = [["Однажды", "в студеную", "зимнюю", "пору"],
                ["Я из лесу", "вышел", "был сильный", "мороз"]]
    
    let sectionableAdapter = SectionableTableAdapter<LabelCell, SectionHeaderView>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sectionableAdapter.data = items.enumerated().map {
            SectionConfiguration(headerItem: "Строка \($0.offset)", items: $0.element)
        }
        
        tableView.setAdapter(sectionableAdapter)
    }
    
}
