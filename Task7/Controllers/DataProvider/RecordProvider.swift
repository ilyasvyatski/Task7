//
//  RecordProvider.swift
//  Task7
//
//  Created by neoviso on 9/11/22.
//

import Foundation
import CoreData

class RecordProvider {
    private weak var fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate?
    
    init(with fetchedResultControllerDelegate: NSFetchedResultsControllerDelegate) {
        self.fetchedResultControllerDelegate = fetchedResultControllerDelegate
    }
    
    lazy var fetchedResultController: NSFetchedResultsController<RecordEntity> = {
        let fetchRequest: NSFetchRequest<RecordEntity> = RecordEntity.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: PersistentStorage.shared.context, sectionNameKeyPath: nil, cacheName: nil)
        controller.delegate = fetchedResultControllerDelegate
        
        do {
            try controller.performFetch()
        } catch {
            print(error)
        }
        
        return controller
    }()
    
    func create(title: String) {
        let recordEntity = RecordEntity(context: PersistentStorage.shared.context)
        recordEntity.id = UUID()
        recordEntity.title = title
        
        PersistentStorage.shared.saveContext()
    }
    
    func addChild(parentRecord: RecordEntity, childTitle: String) {
        let childEntity = RecordEntity(context: PersistentStorage.shared.context)
        childEntity.id = UUID()
        childEntity.title = childTitle
        childEntity.parent = parentRecord
        
        PersistentStorage.shared.saveContext()
    }
}
