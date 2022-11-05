//
//  SwiftGIFPlayerView.swift
//  secretsanta
//
//  Created by Ruben Mkrtumyan on 5.11.2022.
//

import SwiftUI

public struct SwiftGIFPlayerView: UIViewRepresentable {
    
    private var gifName: String
    
    public init(gifName: String) {
        self.gifName = gifName
    }
    
    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SwiftGIFPlayerView>) {
        
    }
    
    public func makeUIView(context: Context) -> UIView {
        return GIFPlayerView(gifName: gifName)
    }
    
}
