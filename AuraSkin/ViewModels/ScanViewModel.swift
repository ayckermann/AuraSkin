//
//  ScanViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI
import Mantis

struct ScanViewModel: View {
    
    let cameraService = CameraServices()
    @State var capturedImage: UIImage?
    @State var isCaptured = false
    @State var isCropped = false
    
    
    @State private var presetFixedRatioType: Mantis.PresetFixedRatioType = .canUseMultiplePresetFixedRatio()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                if(isCropped){
                    Image(uiImage: capturedImage!)
                }
                else{
                    CameraView(cameraServices: cameraService){ result in
                        switch result {
                            
                        case .success(let photo):
                            if let data = photo.fileDataRepresentation(){
                                capturedImage = UIImage(data: data)
                                isCaptured = true
                                
                            }
                            else{
                                print("Error: no image data found")
                            }
                        case .failure(let error):
                            print(error.localizedDescription)
                            
                        }
                    }
                    .padding(EdgeInsets( top: 0, leading: 0, bottom:    400, trailing: 0))
                    .edgesIgnoringSafeArea(.all)
                    
                    ScanView(captureFunction: {
                        cameraService.capturePhoto()
                    }, navGalleryFunction: testButton, navManualInputFunction: testButton)
                }
                
                
                
            }
            .fullScreenCover(isPresented: $isCaptured, content: {
                ImageCropper(image: $capturedImage,
                             presetFixedRatioType: $presetFixedRatioType) { croppedImage in
                    // Handle the cropped image
                    isCropped = true                               // You can use the croppedImage as needed
                } onImageCropCancelled: {
                    // Handle cancellation
                    isCropped = false
                }
                
                .ignoresSafeArea()
            })
            
        }
        
        
    }
}

//#Preview {
//    ScanViewModel()
//}
