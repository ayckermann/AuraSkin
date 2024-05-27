//
//  CameraServices.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation
import AVFoundation
import UIKit

class CameraServices: NSObject {
    
    var session: AVCaptureSession?
    var delegate: AVCapturePhotoCaptureDelegate?
    
    var output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruption(notification:)), name: .AVCaptureSessionWasInterrupted, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruptionEnded(notification:)), name: .AVCaptureSessionInterruptionEnded, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func handleInterruption(notification: Notification) {
        print("Capture session was interrupted")
    }
    
    @objc private func handleInterruptionEnded(notification: Notification) {
        print("Capture session interruption ended")
        startSession()
    }
    
    @objc private func handleDidEnterBackground() {
        print("App entered background")
        stopSession()
        resetCamera()
    }
    
    @objc private func handleWillEnterForeground() {
        print("App will enter foreground")
        startSession()
    }
    
    private func checkPermission(completion: @escaping (Error?) -> ()) {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {
                    completion(NSError(domain: "CameraAccess", code: 1, userInfo: [NSLocalizedDescriptionKey: "Camera access was not granted."]))
                    return
                }
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
                
                self.session = session
                startSession()
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
    
    func stopSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session?.stopRunning()
        }
    }
    
    func startSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.session?.startRunning()
        }
    }
    
    func resetCamera() {
        stopSession()
        session = nil
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
