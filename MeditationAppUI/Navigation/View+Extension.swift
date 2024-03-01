//
//  View+Extension.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import Foundation
import SwiftUI

extension View {
    func navigation(_ view: any View, _ isActive: Binding<Bool>) -> some View {
        modifier(
            NavigationModifier(destinationView: AnyView(view), isActive: isActive)
        )
    }

    func sheet(_ view: any View, _ isPresented: Binding<Bool>) -> some View {
        modifier(
            SheetModifier(presentingView: AnyView(view), isPresented: isPresented)
        )
    }
}
