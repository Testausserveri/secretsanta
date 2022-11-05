//
//  ContentView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            
        }.sheet(isPresented: .constant(true)) {
            SetupView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
