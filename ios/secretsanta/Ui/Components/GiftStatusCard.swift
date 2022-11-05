//
//  GiftStatusCard.swift
//  secretsanta
//
//  Created by Niko Hannolainen on 5.11.2022.
//

import SwiftUI

struct GiftStatusCard: View {
    
    @State private var counter1 = 35
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Reindeer is on its way!").font(.headline)
            Text("Estimated time of arrival: \(self.counter1) min")
                .font(.subheadline)
                .onAppear {
                    self.runCounter(counter: self.$counter1, start: counter1, end: 0, speed: 0.087)
                }
        }.padding(25).frame(minWidth: 0, maxWidth: .infinity).background(Color(.systemGray6)).cornerRadius(18).padding()
    }
    
    func runCounter(counter: Binding<Int>, start: Int, end: Int, speed: Double) {
        counter.wrappedValue = start
        
        Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
            counter.wrappedValue -= 1
            if counter.wrappedValue == end {
                timer.invalidate()
            }
        }
    }
}

struct GiftStatusCard_Previews: PreviewProvider {
    static var previews: some View {
        GiftStatusCard()
    }
}
