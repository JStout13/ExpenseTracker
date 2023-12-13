//
//  ModelsSchemaV1.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/13/23.
//

import SwiftUI
import SwiftData

enum ModelsSchemaV1: VersionedSchema {
    static var versionIdentifier: Schema.Version = Schema.Version(1,0,0)
    
    static var models: [any PersistentModel.Type] {
        [Transaction.self]
    }
    
    @Model
    class Transaction {
        var title: String
        var remarks: String
        var amount: Double
        var dateAdded: Date
        var category: String
        var tintColor: String
        
        init(title: String, remarks: String, amount: Double, dateAdded: Date, category: Category, tintColor: TintColor) {
            self.title = title
            self.remarks = remarks
            self.amount = amount
            self.dateAdded = dateAdded
            self.category = category.rawValue
            self.tintColor = tintColor.color
        }
        
        var color: Color {
            return tints.first(where: { $0.color == tintColor })?.value ?? appTint
        }
    }
}
