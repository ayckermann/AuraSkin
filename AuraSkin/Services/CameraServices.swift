//
//  CameraServices.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation
import AVFoundation

class CameraServices {
    
    var session: AVCaptureSession?
    var delegate: AVCapturePhotoCaptureDelegate?
    
    var output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    private func checkPermission(completion: @escaping (Error?) -> ()) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { return }
                DispatchQueue.main.async {
                    self?.setupCamera(completion: completion)
                }
            }
        case .restricted, .denied:
            completion(NSError(domain: "CameraAccess", code: 1, userInfo: [NSLocalizedDescriptionKey: "Camera access is restricted or denied."]))
        case .authorized:
            setupCamera(completion: completion)
        @unknown default:
            completion(NSError(domain: "CameraAccess", code: 2, userInfo: [NSLocalizedDescriptionKey: "Unknown camera access status."]))
        }
    }
    
    private func setupCamera(completion: @escaping (Error?) -> ()) {
        let session = AVCaptureSession()
        
        if let device = AVCaptureDevice.default(for: .video) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                } else {
                    session.removeOutput(output)
                    output = AVCapturePhotoOutput()
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                DispatchQueue.global(qos: .userInitiated).async {
                    session.startRunning()
                }
                
                self.session = session
                completion(nil)
            } catch {
                completion(error)
            }
        } else {
            completion(NSError(domain: "CameraSetup", code: 3, userInfo: [NSLocalizedDescriptionKey: "No video device available."]))
        }
    }
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping (Error?) -> ()) {
        self.delegate = delegate
        checkPermission(completion: completion)
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        
        guard let delegate = self.delegate else {
            print("Delegate is nil")
            return
        }
        
        output.capturePhoto(with: settings, delegate: delegate)
    }
    
    func stopCamera() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session?.stopRunning()
        }
    }
    
    func toggleFlash() -> Bool {
        guard let device = AVCaptureDevice.default(for: .video) else { return false }
        
        do {
            try device.lockForConfiguration()
            defer { device.unlockForConfiguration() }
            
            if device.hasTorch {
                device.torchMode = device.isTorchActive ? .off : .on
                return device.isTorchActive
            } else {
                return false
            }
        } catch {
            return false
        }
    }
}

