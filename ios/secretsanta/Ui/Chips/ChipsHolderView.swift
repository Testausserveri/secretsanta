//
//  ChipsHolderView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI


struct ChipsHolderView: View {
    @Binding var chips: [ChipModel]
    let callback: () -> Void
    var allowSelect: Bool {
        return chips.filter{$0.selected}.count < 5
    }
    
    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        return GeometryReader { geo in
                ZStack(alignment: .topLeading, content: {
                    ForEach($chips) { chipData in
                        ChipView(chip: chipData, callback: callback, allowSelect: allowSelect)
                        .padding(.all, 5)
                        .alignmentGuide(.leading) { dimension in  
                            if (abs(width - dimension.width) > geo.size.width) {
                                width = 0
                                height -= dimension.height
                            }
                            
                            let result = width
                            if chipData.id == chips.last?.id {
                                width = 0
                            } else {
                                width -= dimension.width
                            }
                            return result
                          }
                        .alignmentGuide(.top) { dimension in
                            let result = height
                            if chipData.id == chips.last?.id {
                                height = 0
                            }
                            return result
                        }
                }
            })
        }.padding([.top, .bottom], 10)
    }
}

struct ChipsHolderView_Previews: PreviewProvider {
    static var previews: some View {
        ChipsHolderView(chips: .constant([
            ChipModel(chipName: "Test", selected: true),
            ChipModel(chipName: "Test pitkä"),
            ChipModel(chipName: "Eee"),
            ChipModel(chipName: "asdadasdasd"),
            ChipModel(chipName: "asd"),
            ChipModel(chipName: "sd"),
            ChipModel(chipName: "sd"),
            ChipModel(chipName: "sd"),
            ChipModel(chipName: "sd"),
            ChipModel(chipName: "sd"),
            ChipModel(chipName: "asdadasdasd"),
        ]), callback: {})
    }
}
