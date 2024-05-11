//
//  CameraView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    
    let cameraServices: CameraServices
    let didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        
        cameraServices.start(delegate: context.coordinator) { error in
            if let error = error{
                didFinishProcessingPhoto(.failure(error))
                return
            }
        }
        
        cameraServices.previewLayer.frame = viewController.view.bounds
//        cameraManager.previewLayer.frame = CGRect(x: -200, y: -49, width: viewController.view.bounds.height, height: viewController.view.bounds.height)
        
        viewController.view.backgroundColor = UIColor.systemBackground
        viewController.view.layer.addSublayer(cameraServices.previewLayer)
        
        
        
//
        
        
        return viewController
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, didFinishProcessingPhoto: didFinishProcessingPhoto)
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    
    
    class Coordinator: NSObject, AVCapturePhotoCaptureDelegate{
        let parent: CameraView
        private var didFinishProcessingPhoto: (Result<AVCapturePhoto, Error>) -> ()
        
        
        init(parent: CameraView, didFinishProcessingPhoto: @escaping (Result<AVCapturePhoto, Error>) -> ()) {
            self.parent = parent
            self.didFinishProcessingPhoto = didFinishProcessingPhoto
        }
        
        func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: (any Error)?) {
            if let error = error {
                didFinishProcessingPhoto(.failure( error))
                return
            }
            didFinishProcessingPhoto(.success(photo))
        }
    }
}
