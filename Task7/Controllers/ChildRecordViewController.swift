//
//  ChildTableViewController.swift
//  Task7
//
//  Created by neoviso on 9/11/22.
//

import UIKit
import CoreData

class ChildTableViewController: UITableViewController {
    
    //private let recordViewModel = RecordViewModel()
    var selectedRecord: RecordEntity!

    lazy var recordDataProvider: RecordProvider = {
        let dataProvider = RecordProvider(with: self)
        dataProvider.fetchedResultController.fetchRequest.predicate = NSPredicate(format: "parent == %@", selectedRecord)
        try? dataProvider.fetchedResultController.performFetch()
        return dataProvider
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedRecord.title
        self.tableView.tableFooterView = UIView()
    }
    
    @IBAction func addChildRecordButton(_ sender: UIBarButtonItem) {
        createRecordAlert(with: "Add Child Record", "", "Add", "Cancel", "Enter here", records: recordDataProvider.fetchedResultController.fetchedObjects) { text in
            /*let childRecord = Record(id: UUID(), title: text)
            self.recordViewModel.addChildRecord(parentRecord: self.selectedRecord.convertToRecord(), child: childRecord)*/
            self.recordDataProvider.addChild(parentRecord: self.selectedRecord, childTitle: text)
        }
    }
}


