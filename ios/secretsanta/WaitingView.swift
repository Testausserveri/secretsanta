//
//  WaitingView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI

struct WaitingView: View {
    
    @State private var continueDisabled = true
    @EnvironmentObject var appState: AppState
    @State private var showConfirmDialog = false
    
    var body: some View {
        
        NavigationView {
            VStack(alignment: .leading) {
                Text("Thank you for your gift!")
                    .padding(.bottom)
                
                Text("Time for the exciting part: waiting for your Secret Santa!")
                    .fontWeight(.medium)
                    .padding(.bottom)
                
                Text("You will receive a notification once your gift can be redeemed.")
                
                Spacer()
                
                Image("gift-tree")
                    .resizable()
                
                Spacer()
                
                
                Text("Time until you can redeem your gift: 5 days 12 hours")
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                
                HStack(alignment: .center) {
                    Button(action: {
                        showConfirmDialog.toggle()
                    }) {
                        Text("Redeem Gift!").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(continueDisabled)
                    .confirmationDialog(
                        "Are you ready to redeem your gift? The gift will arrive in approx. 35 minutes.",
                        isPresented: $showConfirmDialog, titleVisibility: .visible) {
                            Button {
                                appState.madeGift = true
                            } label: {
                                Text("Redeem gift now")
                            }
                            Button("Cancel", role: .cancel) {
                                showConfirmDialog.toggle()
                            }
                        }
                        .task {
                            try? await Task.sleep(nanoseconds: 3_000_000_000)
                            continueDisabled.toggle()
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
}

struct WaitingView_Previews: PreviewProvider {
    static var previews: some View {
        WaitingView()
    }
}
