//
//  CameraManager.swift
//  MeditationAppUI
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 23/03/24.
//

import AVFoundation
import Foundation

class CameraManager: ObservableObject {
    @Published var permissionGranted = false

    func requestPermission() {
        AVCaptureDevice.requestAccess(for: .video) { accessGranted in
            DispatchQueue.main.async {
                self.permissionGranted = accessGranted
            }
        }
    }
}
