//
//  SheetModifier.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import Foundation
import SwiftUI

struct SheetModifier: ViewModifier {
    
    var presentingView: AnyView
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                self.presentingView
            }
    }
}
