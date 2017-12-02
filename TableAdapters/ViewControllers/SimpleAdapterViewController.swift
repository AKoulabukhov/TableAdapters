//
//  SimpleAdapterViewController.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 02/12/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit

class SimpleAdapterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let items = ["Однажды", "в студеную", "зимнюю", "пору"]
    
    let adapterFirst = SimpleTableAdapter<LabelCell>()
    let adapterSecond = SimpleTableAdapter<ImageLabelCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareItems()
        tableView.setAdapter(self.adapterFirst)
    }
    
    func prepareItems() {
        self.adapterFirst.items = items
        self.adapterSecond.items = self.items.map { (RandomImageURLFactory.make(), $0) }
    }
    
    @IBAction func segmentedControlAction(_ segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.tableView.setAdapter(adapterFirst)
        case 1:
            self.tableView.setAdapter(adapterSecond)
        default:
            break
        }
        tableView.reloadData()
    }
}
