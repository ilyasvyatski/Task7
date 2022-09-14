//
//  RecordEntity+CoreDataProperties.swift
//  Task7
//
//  Created by neoviso on 9/12/22.
//
//

import Foundation
import CoreData


extension RecordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecordEntity> {
        return NSFetchRequest<RecordEntity>(entityName: "RecordEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var children: Set<RecordEntity>?
    @NSManaged public var parent: RecordEntity?
}

// MARK: Generated accessors for children
extension RecordEntity {

    @objc(addChildrenObject:)
    @NSManaged public func addToChildren(_ value: RecordEntity)

    @objc(removeChildrenObject:)
    @NSManaged public func removeFromChildren(_ value: RecordEntity)

    @objc(addChildren:)
    @NSManaged public func addToChildren(_ values: Set<RecordEntity>)

    @objc(removeChildren:)
    @NSManaged public func removeFromChildren(_ values: Set<RecordEntity>)

}

extension RecordEntity : Identifiable {

}





