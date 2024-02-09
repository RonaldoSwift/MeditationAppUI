//
//  Veamos.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import Foundation
import SwiftUI

struct RootPresentationModeKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(Bool())
}

extension EnvironmentValues {
    var rootPresentationMode: Binding<Bool> {
        get { return self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

extension Bool {
    
    public mutating func dismiss() {
        self.toggle()
    }
}
