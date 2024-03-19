//
//  ProfileView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 15/03/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var shouldPresentCamera = false
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var image: Image = Image(ImageResource.profile)
    @State private var inputUIImage: UIImage?

    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                    .frame(width: 80, height: 80)

                VStack {
                    Text("Nombre: Ronaldo Andre")
                    Text("Edad: 20")
                }
            }

            Button(action: {
                NotificationManager.shared.removeAllNotifications()
            }, label: {
                Text("Mostrar Notification")
            })
            Spacer()
        }
        .onTapGesture {
            shouldPresentActionScheet = true
        }
        .onChange(of: inputUIImage) { _ in
            loadImage()
        }
        .sheet(isPresented: $shouldPresentImagePicker, onDismiss: {}, content: {
            PHImagePickerView(image: $inputUIImage)
        })
        .actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text("Choose mode"), message: Text("Please choose your prefeage"), buttons: [
                ActionSheet.Button.default(Text("Camera"), action: {
                    self.shouldPresentCamera = true
                    // self.shouldPresentCamera = true
                }), ActionSheet.Button.default(Text("Photo Library"), action: {
                    self.shouldPresentImagePicker = true
                    // self.shouldPresentCamera = false
                }), ActionSheet.Button.cancel()])
        }
    }

    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        image = Image(uiImage: inputUIImage)
    }
}

#Preview {
    ProfileView()
}
