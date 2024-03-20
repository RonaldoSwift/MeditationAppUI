//
//  TextToolbarContent.swift
//  MeditationAppUI
//
//  Created by Ronaldo Andre on 18/03/24.
//

import Foundation
import SwiftUI

struct TextToolbarContent: ToolbarContent {
    var image: Image = Image(ImageResource.back)

    @Environment(\.presentationMode) var presentationMode

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                image
                    .resizable()
                    .frame(width: 40, height: 40)
            }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                Image(ImageResource.like)
                    .resizable()
                    .frame(width: 40, height: 40)
            })
        }

        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: /*@START_MENU_TOKEN@*/ {}/*@END_MENU_TOKEN@*/, label: {
                Image(ImageResource.dowload)
                    .resizable()
                    .frame(width: 40, height: 40)
            })
        }
    }
}
