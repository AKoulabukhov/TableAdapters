//
//  ViewController.swift
//  TableAdapters
//
//  Created by Alexander Kulabukhov on 10/10/2017.
//  Copyright © 2017 Alexander Kulabukhov. All rights reserved.
//

import UIKit
import CoreData

let modelUrl = Bundle.main.url(forResource: "DataModel", withExtension: "momd")!

class FRCAdapterViewController: UIViewController {
    
    let coreData = NSPersistentContainer(name: "Container", managedObjectModel: NSManagedObjectModel(contentsOf: modelUrl)!)
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetchAdapter: FRCTableAdapter<FRCCell>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coreData.loadPersistentStores { _,_ in self.setupAdapter() }
    }
    
    func setupAdapter() {
        self.coreData.viewContext.automaticallyMergesChangesFromParent = true
        let request: NSFetchRequest<StringWrapper> = StringWrapper.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "string", ascending: false)]
        let fetchAdapter = FRCTableAdapter<FRCCell>(fetchRequest: request,
                                                    managedObjectContext: coreData.viewContext)
        
        self.tableView.setAdapter(fetchAdapter)
        self.fetchAdapter = fetchAdapter
    }

    @IBAction func addAction(_ sender: Any) {
        let context = coreData.newBackgroundContext()
        let stringWrapper = NSEntityDescription.insertNewObject(forEntityName: "StringWrapper", into: context) as! StringWrapper
        let randomNumber = arc4random() % 90 + 10
        stringWrapper.string = "Случайная циферка \(randomNumber)"
        try? context.save()
    }
    
    @IBAction func clearAction(_ sender: Any) {
        let context = coreData.newBackgroundContext()
        let fetchRequest: NSFetchRequest<StringWrapper> = StringWrapper.fetchRequest()
        guard let objects = try? context.fetch(fetchRequest) else { return }
        objects.forEach { context.delete($0) }
        try? context.save()
    }
    
}

