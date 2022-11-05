//
//  ContentView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var setupComplete = false
    @Published var madeOrder = false
    @Published var madeGift = false
    @Published var interests:[ChipModel] = []
    
    //Prototype
    @Published var orderPickuped = false
    @Published var giftPickuped = false
}

struct ContentView: View {
    @StateObject var appState = AppState()
    var body: some View {
        if(appState.setupComplete && appState.orderPickuped && appState.madeGift && appState.giftPickuped) {
            
            TakePictureView().environmentObject(appState)
            
        } else if(appState.setupComplete && appState.orderPickuped && appState.madeGift == false && appState.giftPickuped == false) {
            WaitingView().environmentObject(appState)
        } else {
            NavigationView {
                VStack {
                    if (appState.setupComplete && (appState.orderPickuped == false || appState.giftPickuped == false) ) {
                        MainView()
                    } else if (appState.setupComplete == false){
                        WelcomeView()
                    }
                }
            }.environmentObject(appState)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
