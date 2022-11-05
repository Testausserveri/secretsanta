//
//  WelcomeView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showSetupSheet = false
    var body: some View {
        VStack() {
            Text("You haven’t yet signed up for **City Secret Santa 2022**. Click below to get started!")
                
            Spacer()
            Image("reindeer-gift")
            Spacer()
            Button(action: {showSetupSheet = true}) {
                Text("Get started")
            }
            .frame(width: nil)
            .buttonStyle(.borderedProminent)
            .controlSize(.large).sheet(isPresented: $showSetupSheet) {
                NavigationView {
                    InterestsView()
                }
            }
            
        }
        .navigationBarTitle(Text("City Secret Santa"))
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
