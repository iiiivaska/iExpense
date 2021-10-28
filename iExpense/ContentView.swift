//
//  ContentView.swift
//  iExpense
//
//  Created by Василий Буланов on 10/27/21.
//

import SwiftUI

struct ContentView: View {
    
    struct User: Codable {
        var firstName: String
        var lastName: String
    }
    
    @State private var user = User(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserDate")
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
