//
//  InterestsView.swift
//  secretsanta
//
//  Created by Mikael Hannolainen on 5.11.2022.
//

import SwiftUI
import WrappingHStack

struct InterestsView: View {
    @State private var searchText = ""
    
    @State private var chips = [ChipModel(chipName: "Cats"), ChipModel(chipName: "Makeup"), ChipModel(chipName: "Hardware"), ChipModel(chipName: "Gaming"), ChipModel(chipName: "Sauna"), ChipModel(chipName: "Bakery"), ChipModel(chipName: "Wine"), ChipModel(chipName: "Brooms")]

    @State private var continueDisabled = true
    
    var body: some View {
            VStack(alignment: .leading) {
                Text("This information will be given to the person sending you your gift.")
                    .padding(.vertical)

                Text("Choose 3 to 5 interests.")
                
                ChipsHolderView(chips: $chips, callback: {
                    continueDisabled = chips.filter{$0.selected}.count < 3
                })
                
                    
                Spacer()
                HStack(alignment: .center) {
                    
                    NavigationLink(destination: LocationView()){
                        Text("Continue").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .disabled(continueDisabled)
                    
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
            .searchable(text: $searchText)
            .navigationBarTitle(Text("Your Interests"))
    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView()
    }
}
