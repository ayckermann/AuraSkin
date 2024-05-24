//
//  CameraView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    var ratioX: Double
    var ratioY: Double

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
        
        let screenWidth = viewController.view.bounds.width
//        let screenHeight = viewController.view.bounds.height
        
        let previewWidth = screenWidth
        let previewHeight = screenWidth * (ratioY / ratioX) //
        
        let xOffset = CGFloat(0.0)
        let yOffset = CGFloat(65.0)
            //(screenHeight - previewHeight) / 2.0
        
        cameraServices.previewLayer.frame = CGRect(x: xOffset, y: yOffset, width: previewWidth, height: previewHeight)
        
        // Add preview layer to view controller's view
        viewController.view.backgroundColor = .black
        viewController.view.layer.addSublayer(cameraServices.previewLayer)
                
        
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
