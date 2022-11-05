//
//  ChipView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI


struct ChipView: View {
    var chip: ChipModel
    @State var isSelected: Bool
    
    var body: some View {
        if (isSelected) {
            Button(chip.chipName) {
                print("clic")
                isSelected.toggle()
            }
            .buttonStyle(.borderedProminent)
            .clipShape(Capsule())
        } else {
            Button(chip.chipName) {
                print("clic2")
                isSelected.toggle()
            }
            .buttonStyle(.bordered)
            .clipShape(Capsule())
        }
    }
}

struct ChipView_Previews: PreviewProvider {
    static var previews: some View {
        ChipView(chip: ChipModel(chipName: "testi", selected: false), isSelected: false)
        ChipView(chip: ChipModel(chipName: "testi", selected: true), isSelected: true)
    }
}
