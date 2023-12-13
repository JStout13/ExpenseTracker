//
//  Enums.swift
//  ExpenseTracker
//
//  Created by Jason Stout on 12/12/23.
//

import SwiftUI

enum LockType: String {
    case biometric = "Bio Metric Auth"
    case number = "Custom Number Lock"
    case both = "First preference will be biometric, and if it's not available, it will go for number lock."
}
