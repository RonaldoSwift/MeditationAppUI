//
//  RootPresentationModeKey.swift
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
        get { self[RootPresentationModeKey.self] }
        set { self[RootPresentationModeKey.self] = newValue }
    }
}

public extension Bool {
    mutating func dismiss() {
        toggle()
    }
}
