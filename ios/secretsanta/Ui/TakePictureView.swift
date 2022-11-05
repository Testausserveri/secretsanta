//
//  TakePictureView.swift
//  secretsanta
//
//  Created by Niko Hannolainen on 5.11.2022.
//

import SwiftUI

struct TakePictureView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("The gifts are being delivered! Thank you for participating this year!").padding(.bottom)
                
                Text("Submit a picture to showcase your gift!")
                
                Spacer()
                SwiftGIFPlayerView(gifName: "take-picture")
                Spacer()
                
                HStack(alignment: .center) {
                    Button(action: { }) {
                        Text("Take a Picture").frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .frame(maxWidth: .infinity)
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    
                }
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                
                
            }.frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .padding([.leading, .trailing], 20)
            .navigationBarTitle(Text("City Secret Santa"))
        }
    }
}

struct TakePictureView_Previews: PreviewProvider {
    static var previews: some View {
        TakePictureView()
    }
}
