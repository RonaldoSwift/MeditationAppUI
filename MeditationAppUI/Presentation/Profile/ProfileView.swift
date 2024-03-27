//
//  ProfileView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 15/03/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var cameraManager = CameraManager()
    @State private var shouldPresentAlertPermissionMessage = false
    @State private var userClickOnCamera = false

    @State private var shouldPresentCamera = false
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionScheet = false
    @State private var image: Image = Image(ImageResource.profileCamera)
    @State private var inputUIImage: UIImage?

    @EnvironmentObject private var appRootManager: AppRootManager

    @StateObject private var profileViewModel = Injector.container.resolve(ProfileViewModel.self)!

    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                    .frame(width: 120, height: 120)
                    .padding(.all, 20)

                VStack {
                    Text("Nombre: Ronaldo Andre")
                    Text("Edad: 20")
                }
            }

            Button(action: {
                NotificationManager.shared.scheduleNotification(triggerType: .time)
            }, label: {
                Text("Mostrar Notification con Badge")
            })
            Button(action: {
                NotificationManager.shared.scheduleNotificationWithActions(triggerType: .time)
            }, label: {
                Text("Mostrar Notification con Actions")
            })
            Button(action: {
                NotificationManager.shared.scheduleNotificationWithIconsAndActions()
            }, label: {
                Text("Mostrar Notification con Actions and Icons")
            })
            Button(action: {
                NotificationManager.shared.scheduleNotificationWithImagesAndActions()
            }, label: {
                Text("Mostrar Notification con Imagen")
            })

            Button(action: {
                profileViewModel.logout()
                appRootManager.currentRoot = .authentication
            }, label: {
                Text("Cerra Sesión")
            })
            Spacer()
        }
        .onTapGesture {
            shouldPresentActionScheet = true
        }
        .onChange(of: inputUIImage) { _ in
            loadImage()
        }
        .alert(isPresented: $shouldPresentAlertPermissionMessage) {
            Alert(
                title: Text("El permiso de Camara no esta permitido"),
                message: Text("Tienes que aceptar el permiso de camara"),
                dismissButton: .default(
                    Text("Open Settings"),
                    action: {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    }
                )
            )
        }
        .sheet(isPresented: $shouldPresentCamera, onDismiss: {}, content: {
            AccessCameraView(selectedImage: $inputUIImage)
        })
        .sheet(isPresented: $shouldPresentImagePicker, onDismiss: {}, content: {
            PHImagePickerView(image: $inputUIImage)
        })
        .actionSheet(isPresented: $shouldPresentActionScheet) { () -> ActionSheet in
            ActionSheet(title: Text("Choose mode"), message: Text("Please choose your prefeage"), buttons: [
                ActionSheet.Button.default(Text("Camera"), action: {
                    cameraManager.requestPermission()
                    userClickOnCamera = true
                    // self.shouldPresentCamera = true
                    // self.shouldPresentCamera = true
                }), ActionSheet.Button.default(Text("Photo Library"), action: {
                    self.shouldPresentImagePicker = true
                    // self.shouldPresentCamera = false
                }), ActionSheet.Button.cancel()])
        }
        .onReceive(cameraManager.$permissionGranted, perform: { granted in
            if granted {
                shouldPresentCamera = true
            } else if userClickOnCamera {
                shouldPresentAlertPermissionMessage = true
            }
        })
    }

    func loadImage() {
        guard let inputUIImage = inputUIImage else { return }
        image = Image(uiImage: inputUIImage)
    }
}

#Preview {
    ProfileView()
}
