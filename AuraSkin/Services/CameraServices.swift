//
//  CameraServices.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation
import AVFoundation

class CameraServices{
    
    var session: AVCaptureSession?
    var delegate: AVCapturePhotoCaptureDelegate?
    
    var output = AVCapturePhotoOutput()
    let previewLayer = AVCaptureVideoPreviewLayer()
    
    private func checkPermission(completion: @escaping(Error?) ->()){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {return}
                DispatchQueue.main.async {
                    self?.setupCamera(completion: completion)
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera(completion: completion)
        @unknown default:
            break
        }
    }
    
    
    private func setupCamera(completion: @escaping(Error?) ->()){
        let session = AVCaptureSession()
        
        //        session.sessionPreset = AVCaptureSession.Preset.photo
        
        if let device = AVCaptureDevice.default(for: .video){
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                }
                
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
                
                else if !session.canAddOutput(output) {
                    session.removeOutput(output)
                    
                    output = AVCapturePhotoOutput()
                }
                
                previewLayer.videoGravity = .resizeAspect
                
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
                
            } catch  {
                completion(error)
            }
        }
    }
    
    func start(delegate: AVCapturePhotoCaptureDelegate, completion: @escaping(Error?) ->()){
        self.delegate = delegate
        checkPermission(completion: completion)
    }
    
    func capturePhoto(with settings: AVCapturePhotoSettings = AVCapturePhotoSettings()){
        output.capturePhoto(with: settings, delegate: self.delegate!)
    }
    
    
}
