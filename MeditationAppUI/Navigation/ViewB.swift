//
//  ViewB.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct ViewB: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isActiveB : Bool = false

    var body: some View {
        VStack {
            Button("GO BACK") {
                self.presentationMode.wrappedValue.dismiss()
            }
           
            Button("GO TO C") {
                isActiveB = true
            }
        }
        .navigationTitle("B SCREEN")
        .navigation(ViewC(), $isActiveB)
    }
}
