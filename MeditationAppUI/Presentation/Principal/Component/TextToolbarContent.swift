//
//  TextToolbarContent.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 18/03/24.
//

import Foundation
import SwiftUI

struct TextToolbarContent: ToolbarContent {
    @Environment(\.presentationMode) var presentationMode

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(ImageResource.back)
            }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                Image(ImageResource.like)
            })
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                Image(ImageResource.dowload)
            })
        }
    }
}
