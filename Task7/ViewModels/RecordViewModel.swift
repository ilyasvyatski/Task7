//
//  RecordViewModel.swift
//  Task7
//
//  Created by neoviso on 9/10/22.
//

/*import Foundation

struct RecordViewModel {
    
    private let recordDataRepository = RecordDataRepository()
    
    func createRecord(record: Record) {
        recordDataRepository.create(record: record)
    }
    
    func addChildRecord(parentRecord: Record, child: Record) {
        recordDataRepository.addChild(parentRecord: parentRecord, child: child)
    }
    
    func fetchRecord() -> [Record] {
        recordDataRepository.getAll() ?? [Record]()
    }
    
    func fetchRecordById(byId id: UUID) -> Record? {
        recordDataRepository.getById(byId: id)
    }
    
    func updateRecord(record: Record) -> Bool {
        recordDataRepository.update(record: record)
    }
    
    func deleteRecord(byId id: UUID) -> Bool {
        recordDataRepository.delete(id: id)
    }
}*/


/*class RecordViewModel: NSObject {
    
    private var coreDataManager: CoreDataManagerProtocol
    
    var reloadTableView: (() -> ())?
    
    var records = [RecordEntity]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchRecords() {
        coreDataManager.fetchData { records in
            self.records = records!
        }
    }
    
    func saveRecord(title: String) {
        coreDataManager.saveData(title: title)
    }
    
    func deleteRecord(index: Int) {
        coreDataManager.deleteData(index: index)
    }
}*/

/*class RecordViewModel: NSObject {
    
    private var coreDataManager: CoreDataManagerProtocol
    
    var reloadTableView: (() -> Void)?
    
    var records = [RecordEntity]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager()) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchRecords() {
        records = coreDataManager.fetchData() ?? [RecordEntity]()
    }
    
    func saveRecord(title: String) {
        coreDataManager.saveData(title: title)
    }
    
    func deleteRecord(index: Int) {
        coreDataManager.deleteData(index: index)
    }
}*/
