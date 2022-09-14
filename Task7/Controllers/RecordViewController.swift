//
//  TableViewController.swift
//  Task7
//
//  Created by neoviso on 9/10/22.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    //private let recordViewModel = RecordViewModel()
    
    lazy var recordDataProvider: RecordProvider = {
        let dataProvider = RecordProvider(with: self)
        dataProvider.fetchedResultController.fetchRequest.predicate = NSPredicate(format: "parent == %@", 0)
        try? dataProvider.fetchedResultController.performFetch()
        return dataProvider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    @IBAction func addNewRecordButton(_ sender: UIBarButtonItem) {
        createRecordAlert(with: "Add New Record", "", "Add", "Cancel", "Enter here", records: recordDataProvider.fetchedResultController.fetchedObjects) { text in
            //let record = Record(id: UUID(), title: text)
            //self.recordViewModel.createRecord(record: record)
            //guard self.recordDataProvider.fetchedResultController.fetchedObjects?.contains(where: { $0.title == text }) == false else { return }
            self.recordDataProvider.create(title: text)
        }
    }
}
