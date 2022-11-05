//
//  MainView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
                                       longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    @EnvironmentObject var appState: AppState
    var body: some View {
        if(appState.madeGift && appState.giftPickuped) {
            TakePictureView()
        } else if(appState.madeGift && appState.giftPickuped == false) {
            ZStack {
                Map(coordinateRegion: $region).ignoresSafeArea([.all])
                VStack {
                    GiftStatusCard()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            }.task( {
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                appState.giftPickuped = true
            })
        } else if (appState.madeOrder && appState.orderPickuped) {
            WaitingView()
        } else if (appState.madeOrder && (appState.orderPickuped == false)) {
            ZStack {
                Map(coordinateRegion: $region).ignoresSafeArea([.all])
                VStack {
                    StatusCard()
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottom)
            }.task({
                try? await Task.sleep(nanoseconds: 3_000_000_000)
                appState.orderPickuped = true
            })
        } else if (appState.madeOrder == false) {
            RegisteredView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
