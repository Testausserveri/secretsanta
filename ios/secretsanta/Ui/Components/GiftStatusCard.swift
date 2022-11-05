//
//  GiftStatusCard.swift
//  secretsanta
//
//  Created by Niko Hannolainen on 5.11.2022.
//

import SwiftUI

struct GiftStatusCard: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("Reindeer is on its way!").font(.headline)
            Text("Estimated time of arrival: 35 min").font(.subheadline)
        }.padding(25).frame(minWidth: 0, maxWidth: .infinity).background(Color(.systemGray6)).cornerRadius(18).padding()
    }
}

struct GiftStatusCard_Previews: PreviewProvider {
    static var previews: some View {
        GiftStatusCard()
    }
}
