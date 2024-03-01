//
//  Preview.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 29/02/24.
//

import Foundation
import SwiftUI

public struct Preview<Content: View>: View {
    
    let content: Content
    
    public var body: some View {
        Group {
            content
                .environment(\.colorScheme, .light)
                .preferredColorScheme(.light)
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("Pro - Light mode")
            
            content
                .environment(\.colorScheme, .dark)
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 14 Pro")
                .previewDisplayName("Pro - Dark mode")
        }
    }
    
    public init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
}
