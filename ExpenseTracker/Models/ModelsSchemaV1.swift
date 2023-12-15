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
        
        init(title: String = "", remarks: String = "", amount: Double = 0.0, dateAdded: Date = .now, category: Category = .income, tintColor: TintColor = .init(color: "Green", value: .green)) {
            self.title = title
            self.remarks = remarks
            self.amount = amount
            self.dateAdded = dateAdded
            self.category = category.rawValue
            self.tintColor = tintColor.color
        }
        
        @Transient
        var color: Color {
            return tints.first(where: { $0.color == tintColor })?.value ?? appTint
        }
        
        @Transient
        var tint: TintColor? {
            return tints.first(where: { $0.color == tintColor })
        }
        
        @Transient
        var rawCategory: Category? {
            return Category.allCases.first(where: { category == $0.rawValue })
        }
    }
}
