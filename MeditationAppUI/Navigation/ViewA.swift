//
//  ViewA.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct ViewA: View {
    
    @State var isActiveA : Bool = false
    
    var body: some View {
        NavigationView {
            Button("GO TO B") {
                isActiveA = true
            }
            .navigationTitle("A SCREEN")
            .navigation(
                ViewB(), $isActiveA
            )
        }.environment(\.rootPresentationMode, self.$isActiveA)
    }
}
