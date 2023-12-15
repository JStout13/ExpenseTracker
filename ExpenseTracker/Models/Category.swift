//
//  Category.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/11/23.
//

import SwiftUI

enum Category: String, Equatable, CaseIterable {
    case income = "Income"
    case expense = "Expense"
    
    var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}
