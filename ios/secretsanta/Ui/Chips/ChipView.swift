//
//  ChipView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI


struct ChipView: View {
    @Binding var chip: ChipModel
    let callback: () -> Void
    var allowSelect: Bool
    
    var body: some View {
        if (chip.selected) {
            Button(chip.chipName) {
                chip.selected = false
                callback()
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
        } else {
            Button(chip.chipName) {
                if (allowSelect) {
                    chip.selected = true
                    callback()
                }
            }
            .buttonStyle(.bordered)
            .clipShape(Capsule())
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chip: .constant(ChipModel(chipName: "testi", selected: false)), callback: {}, allowSelect: true)
        ChipView(chip: .constant(ChipModel(chipName: "testi", selected: true)), callback: {}, allowSelect: true)
    }
}
