//
//  WelcomeView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack() {
            Text("You haven’t yet signed up for **City Secret Santa 2022**. Click below to get started!")
                
            Spacer()
            Image("reindeer-gift")
            Spacer()
            NavigationLink(destination: InterestsView()) {
                Text("Get started")
            }
            .frame(width: nil)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
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
