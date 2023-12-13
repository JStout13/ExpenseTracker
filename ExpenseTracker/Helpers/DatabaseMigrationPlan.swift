//
//  DatabaseMigrationPlan.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/13/23.
//

import SwiftUI
import SwiftData

enum DatabaseMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [ModelsSchemaV1.self]
    }
    
    static var stages: [MigrationStage] {
        []
    }
}

