//
//  ContentView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack() {
                Text("You haven’t yet signed up for **City Secret Santa 2022**. Click below to get started!")
                    
                Spacer()
                Image("reindeer-gift")
                Spacer()
                Button("Get Started") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
                .frame(width: nil)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
            .navigationBarTitle(Text("City Secret Santa"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
