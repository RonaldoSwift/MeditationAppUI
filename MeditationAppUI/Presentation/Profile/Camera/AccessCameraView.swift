//
//  AccessCameraView.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 23/03/24.
//

import SwiftUI

// To access camera, we need to add Privacy — Camera Usage Description in Info.plist:
struct AccessCameraView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        imagePicker.delegate = context.coordinator
        return imagePicker
    }

    func updateUIViewController(_: UIImagePickerController, context _: Context) {
        // We'll not update anything on this view.
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    // Coordinator will help to preview the selected image in the View.
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: AccessCameraView

        init(parent: AccessCameraView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            guard let selectedImage = info[.originalImage] as? UIImage else { return }
            parent.selectedImage = selectedImage
            picker.dismiss(animated: true)
        }
    }
}

// #Preview {
//    AccessCameraView()
// }
