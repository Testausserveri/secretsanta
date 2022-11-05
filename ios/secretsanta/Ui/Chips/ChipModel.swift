//
//  ChipModel.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import Foundation
import SwiftUI

struct ChipModel: Identifiable {
    static func == (lhs: ChipModel, rhs: ChipModel) -> Bool {
        return lhs.id == rhs.id && lhs.selected == rhs.selected
    }
    
    var id: UUID = UUID()

    let chipName: String
    @State var selected = false
}
