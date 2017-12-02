//
//  FRCTableAdapter.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 11/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit
import CoreData

class FRCTableAdapter<Cell: TableAdapterCell>: NSObject, TableAdapter, NSFetchedResultsControllerDelegate where Cell.Item: NSManagedObject {
    
    let cellTypes: [ReusableCell.Type] = [Cell.self]
    
    let fetchResultsController: NSFetchedResultsController<Cell.Item>
    
    weak var tableView: UITableView?
    
    init(fetchRequest: NSFetchRequest<Cell.Item>, managedObjectContext: NSManagedObjectContext) {
        let fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                 managedObjectContext: managedObjectContext,
                                                                 sectionNameKeyPath: nil,
                                                                 cacheName: nil)
        self.fetchResultsController = fetchResultsController
    }
    
    func onAttach(to tableView: UITableView) {
        self.tableView = tableView
        self.fetchResultsController.delegate = self
        try? self.fetchResultsController.performFetch()
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView?.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.tableView?.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            guard let indexPath = newIndexPath else { return }
            self.tableView?.insertRows(at: [indexPath], with: .automatic)
        case .update:
            guard let indexPath = indexPath else { return }
            self.tableView?.reloadRows(at: [indexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
        case .move:
            guard let indexPath = indexPath, let newIndexPath = newIndexPath else { return }
            self.tableView?.moveRow(at: indexPath, to: newIndexPath)
        }
    }
    
    // MARK: - Data source & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResultsController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as! Cell).configure(with: self.fetchResultsController.fetchedObjects![indexPath.row])
    }
    
}
