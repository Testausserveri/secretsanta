//
//  StatusCard.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI

struct StatusCard: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Pick up ordered!").font(.headline)
            Text("Estimated time of arrival: 30 min").font(.subheadline)
        }.padding(25).frame(minWidth: 0, maxWidth: .infinity).background(Color(.systemGray6)).cornerRadius(18).padding()
    }
}

struct StatusCard_Previews: PreviewProvider {
    static var previews: some View {
        StatusCard()
    }
}
