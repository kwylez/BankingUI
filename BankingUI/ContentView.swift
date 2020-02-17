//
//  ContentView.swift
//  BankingUI
//
//  Created by Cory D. Wiles on 2/13/20.
//  Copyright © 2020 Cory D. Wiles. All rights reserved.
//

import SwiftUI

let weekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())
let twoDaysAgo = Calendar.current.date(byAdding: .day, value: -2, to: Date())
let dayAgo = Calendar.current.date(byAdding: .day, value: -1, to: Date())

struct ContentView: View {
    
    var transactions: Array<Transaction> = [

            Transaction(category: .groceries, date: dayAgo!, amount: 120.93),
            Transaction(category: .online, date: twoDaysAgo!, amount: 10.03),
            Transaction(category: .groceries, date: weekAgo!, amount: 20.89),
            Transaction(category: .hotel, date: weekAgo!, amount: 320.89)
    ]
    
    func randomCoord(_ max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    var body: some View {
        
        GeometryReader { reader in
            ZStack {
                
                LinearGradient(
                    gradient:
                    Gradient(
                        colors: [
                            Color("TopPink"),
                            Color("BottomPink")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ).edgesIgnoringSafeArea(.all)
                
                ///
                
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.1)
                    .cornerRadius(10.0)
                    .frame(width: 75, height: 207.0)
                    .position(x: reader.size.width - 35, y: 50.0)
                
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.1)
                    .cornerRadius(15.0)
                    .frame(width: 145, height: 110.0)
                    .position(x: reader.size.width-72.5, y: 100.0)
                
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.1)
                    .cornerRadius(10.0)
                    .frame(width: 60, height: 110.0)
                    .position(x: 0, y: reader.size.height / 3)
                
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.15)
                    .cornerRadius(15.0)
                    .frame(width: 260, height: 110.0)
                    .position(x: 0, y: (reader.size.height / 3) + 85)
                
                Rectangle()
                    .foregroundColor(.white)
                    .opacity(0.15)
                    .cornerRadius(15.0)
                    .frame(width: 165, height: 140.0)
                    .position(x: reader.size.width / 2, y: reader.size.height)
                ///
                
                VStack {
                    
                    Text("Bank Account")
                        .foregroundColor(.white)
                        .font(.title).bold()
                        .padding([.top, .bottom])

                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .opacity(0.80)
                            .cornerRadius(15.0)
                            .padding([.leading, .trailing, .bottom])
                            .frame(height: 150.0)

                        HStack {

                            VStack(alignment: .leading, spacing: 10.0) {
                                Text("Current Balance - 02/15/2020")
                                    .font(.headline).bold()
                                    .foregroundColor(Color("TopPink"))
                                    .opacity(0.8)
                                Text("$1,200.13")
                                    .font(.title).bold()
                                    .foregroundColor(Color("TopPink"))
                            }
                            .padding(.leading, 55.0)
                            Spacer()
                        }
                    }
                    Spacer()
                    List {
                        ForEach(self.transactions, id: \.id) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    }
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(25.0)
                            .frame(height: 75.0)
                            .opacity(0.45)
                        HStack(alignment: .center) {
                            Image(systemName: "clock")
                                .font(.largeTitle)
                                .padding(.leading, 50.0)
                                .foregroundColor(Color("TopPink"))
                            Image(systemName: "envelope.badge")
                                .font(.largeTitle)
                                .padding(.leading, 50.0)
                                .opacity(0.4)
                            Image(systemName: "person")
                                .font(.largeTitle)
                                .padding(.leading, 50.0)
                                .opacity(0.4)
                            Spacer()
                        }
                        
                        HStack {
                            Spacer()
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(15.0)
                                Image(systemName: "plus")
                                    .foregroundColor(Color("TopPink"))
                                    .font(.system(size: 40, weight: .bold))
                                    .opacity(0.6)
                            }
                            .frame(width: 75, height: 75.0)
                            .padding(.trailing)
                            .offset(x: 0, y: -10)
                            
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
