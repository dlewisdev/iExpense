//
//  AddView.swift
//  iExpense
//
//  Created by Danielle Lewis on 7/15/23.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @ObservedObject var expenses: Expenses
    
    //makes the view dismiss itself
    @Environment(\.dismiss) var dismiss
    
    let types = ["Business", "Personal"]
    
    
        var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .localCurrency)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense ")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    //after button adds save items, it will dismiss
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
