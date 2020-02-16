//
//  Transaction.swift
//  BankingUI
//
//  Created by Cory D. Wiles on 2/15/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import Foundation

enum TransactionCategory {
    case groceries, online, hotel
}

extension TransactionCategory {
    
    var displayValue: String {
        
        switch self {
            
        case .groceries:
            return "Groceries"
        case .online:
            return "Online"
        case .hotel:
            return "Hotel"
        }
    }
}

struct Transaction: Identifiable {
    
    // MARK: Internal (properties)
    
    let id: UUID = UUID()
    
    let category: TransactionCategory
    
    let date: Date
    
    let amount: Float
}
