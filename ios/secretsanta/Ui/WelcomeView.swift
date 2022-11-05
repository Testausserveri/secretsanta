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
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                
            Spacer()
            Image("reindeer-gift")
            Spacer()
            
            HStack(alignment: .center) {
                Button(action: {showSetupSheet = true}) {
                    Text("Get Started").frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .sheet(isPresented: $showSetupSheet) {
                    NavigationView {
                        InterestsView()
                    }}
                            
            }
            

            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .navigationBarTitle(Text("City Secret Santa"))
        .padding([.leading, .trailing], 15)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WelcomeView()
        }
    }
}
