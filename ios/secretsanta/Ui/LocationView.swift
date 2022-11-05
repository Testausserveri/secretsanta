//
//  LocationView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct LocationMap: View {
    @StateObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
            longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
            LocationButton {
                locationManager.requestLocation()
            }
            .frame(width: 180, height: 40)
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .padding()
        }
    }
}

final class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 42.0422448, longitude: -102.0079053),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async {
            self.location = location.coordinate
            self.region = MKCoordinateRegion(
                center: location.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //Handle any errors here...
        print (error)
    }
}

struct LocationView: View {
    @State private var text = ""
    @EnvironmentObject var appState: AppState

    var body: some View {
            VStack(alignment: .leading) {
                LocationMap()
                    .frame(maxHeight: 300)
                
                Text("The Wolt Reindeer will pick up your gift and deliver to this address.")
                
                Text("Instructions for the Reindeer")
                    .fontWeight(.medium)
                    .lineLimit(nil)
                    .padding(.top)
                TextField("I've been a good kid this year", text: $text, axis: .vertical)
                    .lineLimit(4, reservesSpace: true)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                HStack(alignment: .center) {
                    Button(action: {appState.setupComplete = true}) {
                        Text("Continue").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding([.leading, .trailing],15)
            .navigationBarTitle(Text("Your Location"))
    }
    
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocationView()
        }
    }
}
