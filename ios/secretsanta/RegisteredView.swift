//
//  RegisteredView.swift
//  secretsanta
//
//  Created by Niko Hannolainen on 5.11.2022.
//

import SwiftUI

struct RegisteredView: View {
    
    @State private var secretSantaInterests: [String] = ["football", "comedy movies", "kebab roll", "liver box", "music"]
    
    @State private var showConfirmDialog = false
    @EnvironmentObject var appState: AppState
    var body: some View {
            VStack(alignment: .leading) {
                Text("You are now registered for City Secret Santa 2022!")
                    .padding(.bottom)
                Text("You are the Secret Santa for the following person:")
                VStack() {
                    Text("**Pasi**")
                        .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        Text("They are interested in:")
                        
                        ForEach(secretSantaInterests, id: \.self) { interest in
                            Text("•\t\(interest)")
                        }
                        
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                Spacer()
                Image("gift-box")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                Spacer()
                Text("You have 3 days 12 hours to make the present and order pickup.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                HStack(alignment: .center) {
                    Button(action: {showConfirmDialog.toggle()}) {
                        Text("Order Pick Up").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .confirmationDialog(
                        "Is your gift ready and wrapped? The Reindeer will arrive in approx. 20 minutes.",
                        isPresented: $showConfirmDialog, titleVisibility: .visible) {
                            Button {
                                appState.madeOrder = true
                            } label: {
                                Text("Confirm order")
                            }
                            Button("Cancel", role: .cancel) {
                                showConfirmDialog.toggle()
                            }
                    }
                    
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding([.leading, .trailing], 20)
            .navigationBarTitle(Text("City Secret Santa"))
        }
}

struct RegisteredView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisteredView()
        }
    }
}
