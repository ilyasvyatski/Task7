//
//  CDRecordExtensions.swift
//  Task7
//
//  Created by neoviso on 9/14/22.
//

/*import Foundation

extension RecordEntity {
    func convertToRecord() -> Record
    {
        return Record(id: self.id!, title: self.title!, childRecords: self.convertToRecords())
    }
    
    private func convertToRecords() -> [Record]?
    {
        guard self.children != nil && self.children?.count != 0 else { return nil }

        var records: [Record] = []

        self.children?.forEach({ (recordEntity) in
            records.append(recordEntity.convertToRecord())
        })

        return records
    }
}*/
