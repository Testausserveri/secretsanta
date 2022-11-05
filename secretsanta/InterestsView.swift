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
    let interests = ["Cats", "Makeup", "Hardware", "Gaming", "Sauna", "Bakery", "Wine", "Brooms"]
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("This information will be given to the person sending you your gift.")
                    .padding(.vertical)

                Text("Choose 3 to 5 interests.")
                /* to-do: korjaa tää et se oikeesti wrappaa https://github.com/dkk/WrappingHStack */
                WrappingHStack() {
                    ForEach(searchResults, id: \.self) { interest in
                        Button(interest) {
                            
                        }
                        .buttonStyle(.bordered)
                        
                    }
                }
                
                    
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
            .searchable(text: $searchText)
            .navigationBarTitle(Text("Your Interests"))
        }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return interests
        } else {
            return interests.filter { $0.contains(searchText) }
        }
    }
}

struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView()
    }
}
