//
//  RecordDataRepository.swift
//  Task7
//
//  Created by neoviso on 9/11/22.
//

/*import Foundation
import CoreData

protocol RecordRepository {
    func create(record: Record)
    func getAll() -> [Record]?
    func getById(byId id: UUID) -> Record?
    func update(record: Record) -> Bool
    func delete(id: UUID) -> Bool
    func addChild(parentRecord: Record, child: Record)
}

struct RecordDataRepository: RecordRepository {
    
    func create(record: Record) {
        let recordEntity = RecordEntity(context: PersistentStorage.shared.context)
        recordEntity.title = record.title
        recordEntity.id = record.id
        
        PersistentStorage.shared.saveContext()
    }
    
    func addChild(parentRecord: Record, child: Record) {
        let recordEntity = getRecordEntityById(ById: parentRecord.id)
        
        let childEntity = RecordEntity(context: PersistentStorage.shared.context)
        childEntity.title = child.title
        childEntity.id = child.id
        childEntity.parent = recordEntity
        
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [Record]? {
        do {
            guard let result = try PersistentStorage.shared.context.fetch(RecordEntity.fetchRequest()) as? [RecordEntity] else { return nil }
            
            var records: [Record] = []
            result.forEach { recordEntity in
                records.append(recordEntity.convertToRecord())
            }
            return records
        } catch let error {
            print(error)
        }
        return nil
    }
    
    func getById(byId id: UUID) -> Record? {
        let recordEntity = getRecordEntityById(ById: id)
        guard recordEntity != nil else { return nil }
        
        return recordEntity?.convertToRecord()
    }
    
    func update(record: Record) -> Bool {
        let recordEntity = getRecordEntityById(ById: record.id)
        guard recordEntity != nil else { return false }
        
        recordEntity?.title = record.title
        
        PersistentStorage.shared.saveContext()
        
        return true
    }
    
    func delete(id: UUID) -> Bool {
        let recordEntity = getRecordEntityById(ById: id)
        guard recordEntity != nil else { return false }
        
        PersistentStorage.shared.context.delete(recordEntity!)
        PersistentStorage.shared.saveContext()
        
        return true
    }
    
    private func getRecordEntityById(ById id: UUID) -> RecordEntity? {
        let fetchRequest = NSFetchRequest<RecordEntity>(entityName: "RecordEntity")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else { return nil }
            return result
        } catch let error {
            print(error)
        }
        return nil
    }
}*/
