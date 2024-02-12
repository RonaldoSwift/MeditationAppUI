//
//  NavigationModifier.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import Foundation
import SwiftUI

struct NavigationModifier: ViewModifier {
    
    var destinationView: AnyView
    @Binding var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .background(
                NavigationLink(
                    destination: self.destinationView,
                    isActive: $isActive
                ) {
                    EmptyView()
                }
            )
    }
}
