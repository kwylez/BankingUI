//
//  MenuRow.swift
//  BankingUI
//
//  Created by Cory D. Wiles on 2/17/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

struct MenuRowItem {
    
    let text: String
    
    let systemImag: String
    
    let color: Color
}

struct MenuRow: View {
    
    var rowItem: MenuRowItem
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 15.0)
                .foregroundColor(.white)
            
            HStack {
                
                Text(self.rowItem.text)
                    .bold()
                    .font(.system(.headline))
                    .padding()
                Spacer()
                ZStack {
                    Circle()
                        .foregroundColor(self.rowItem.color)
                        .opacity(0.1)
                        .frame(width: 25, height: 25)
                    Image(systemName: self.rowItem.systemImag)
                        .foregroundColor(self.rowItem.color)
                        .font(Font.system(.body).bold())
                        .padding()
                }
                .padding(.trailing)
            }
        }
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(rowItem: MenuRowItem(text: "Income", systemImag: "plus", color: Color("Green")))
    }
}
