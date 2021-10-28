//
//  AddView.swift
//  iExpense
//
//  Created by Василий Буланов on 10/28/21.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
    @State private var showAlert = false
    @ObservedObject var expense: Expenses
    @Environment(\.presentationMode) var presentationMode
    
    static let types = ["Buiseness", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Wrong amount"), message: Text("Please enter correct amount"), dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Add new expense")
            .navigationBarItems(trailing: Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expense.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    self.showAlert.toggle()
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expense: Expenses())
    }
}
