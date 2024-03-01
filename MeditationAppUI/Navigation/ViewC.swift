//
//  ViewC.swift
//  DemoSwiftUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 8/02/24.
//

import SwiftUI

struct ViewC: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    @State var isModalActive : Bool = false
    
    var body: some View {
        VStack {
            Button("BACK") {
                self.presentationMode.wrappedValue.dismiss()
            }
            Button("BACK TO ROOT") {
                self.rootPresentationMode.wrappedValue.dismiss()
            }
            Button("SHOW MODAL") {
                isModalActive = true
            }
        }
        .navigationTitle("VIEW C")
        .sheet(ViewD(), $isModalActive)
        
    }
}
