//
//  ContentView.swift
//  iExpense
//
//  Created by Василий Буланов on 10/27/21.
//

import SwiftUI

struct SecondView: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Text("Hello, \(name)!")
        Button("Dismiss") {
               self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Vasilii")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
