//
//  TransactionRow.swift
//  BankingUI
//
//  Created by Cory D. Wiles on 2/15/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct TransactionRow: View {
    
    var transaction: Transaction
    
    private var amount: String {
        return String(format: "-$%.2f", self.transaction.amount)
    }
    
    private var image: Image {
        
        switch self.transaction.category {
        case .groceries:
            return Image(systemName: "cart.fill")
        case .online:
            return Image(systemName: "bag")
        case .hotel:
            return Image(systemName: "bed.double.fill")
        }
    }
    
    private var transactionDate: String {
        
        let formatter = RelativeDateTimeFormatter()
        return formatter.localizedString(for: self.transaction.date, relativeTo: Date())
    }
    
    var body: some View {
    
        HStack(alignment: .top) {
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color("Purple"))
                    .cornerRadius(30.0)
                self.image
                    .foregroundColor(.white)
                    .font(.title)
                    .opacity(0.6)
            }
            .frame(width: 60.0)
            .padding(.leading)
            VStack(alignment: .leading) {
                Text("\(self.transaction.category.displayValue)")
                    .foregroundColor(.white)
                    .bold()
                Text("\(self.transactionDate)")
                    .foregroundColor(.white)
                    .padding(.top)
            }
            .padding(.leading)
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(self.amount)")
                    .foregroundColor(.white)
                    .bold()
            }
            .padding(.trailing)
        }
        .frame(height: 60.0)
        .padding([.top, .bottom])
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let weekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())
        
        return TransactionRow(transaction: Transaction(category: .groceries,
                                                       date: weekAgo!,
                                                       amount: 120.93)).background(Color.red)
    }
}
