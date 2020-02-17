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
                
                ForEach(0...200, id: \.self) { _ in
                    
                    Circle()
                        .foregroundColor(Color("TopPink"))
                        .opacity(0.2)
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                        .repeatForever()
                        .speed(.random(in: 0.05...0.9))
                        .delay(.random(in: 0...2))
                    )
                    .scaleEffect(.random(in: 0.1...2))
                    .frame(width: .random(in: 10...100), height: .random(in: 10...100))
                    .position(x: self.randomCoord(reader.size.width),
                              y: self.randomCoord(reader.size.height))
                }.drawingGroup()
                
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
