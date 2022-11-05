//
//  ContentView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var setupComplete = false
}

struct ContentView: View {
    @StateObject var appState = AppState()
    var body: some View {
        NavigationView {
            VStack {
                if (appState.setupComplete) {
                    // TODO
                } else {
                    WelcomeView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
