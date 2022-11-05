//
//  LocationView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI
import MapKit

struct LocationMap: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.334_900,
            longitude: -122.009_020),
        latitudinalMeters: 750,
        longitudinalMeters: 750
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
}

struct LocationView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            LocationMap()
                .frame(maxHeight: 300)
                .searchable(text: $searchText)
            
            
            Text("The Wolt Reindeer will pick up your gift and deliver to this address.")
            
            Text("Instructions for the Reindeer")
                .padding(.top)
            TextField("Placeholder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
            
            Spacer()
            HStack(alignment: .center) {
                Button(action: { }) {
                    Text("Continue").frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                
            }
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            
            
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .padding([.leading, .trailing], 15)
        
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
