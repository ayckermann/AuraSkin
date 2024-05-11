//
//  ImageCropper.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Mantis
import SwiftUI

struct ImageCropper: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Binding var presetFixedRatioType: Mantis.PresetFixedRatioType
    
    
    @Environment(\.dismiss) var dismiss
    
    var onImageCropped: ((UIImage) -> Void)?
    var onImageCropCancelled: (() -> Void)?
    
    
    class Coordinator: CropViewControllerDelegate {
        
        var parent: ImageCropper
        
        init(_ parent: ImageCropper) {
            self.parent = parent
        }
        
        func cropViewControllerDidCrop(_ cropViewController: Mantis.CropViewController, cropped: UIImage, transformation: Transformation, cropInfo: CropInfo) {
            parent.image = cropped
            parent.onImageCropped?(cropped)
            //     print("transformation is \(transformation)")
            
            self.parent.dismiss()
        }
        
        
        func cropViewControllerDidCancel(_ cropViewController: Mantis.CropViewController, original: UIImage) {
            
            parent.onImageCropCancelled?()

            cropViewController.dismiss(animated: true, completion: nil)

        }
        
        func cropViewControllerDidFailToCrop(_ cropViewController: Mantis.CropViewController, original: UIImage) {
            parent.onImageCropCancelled?()

            cropViewController.dismiss(animated: true, completion: nil)

        }
        
        func cropViewControllerDidBeginResize(_ cropViewController: Mantis.CropViewController) {
            
        }
        
        func cropViewControllerDidEndResize(_ cropViewController: Mantis.CropViewController, original: UIImage, cropInfo: Mantis.CropInfo) {
            
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        var config = Mantis.Config()
        config.cropShapeType = .rect
        
        config.presetFixedRatioType = presetFixedRatioType
        let cropViewController = Mantis.cropViewController(image: image!,
                                                           config: config)
        cropViewController.delegate = context.coordinator
        return cropViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
}
