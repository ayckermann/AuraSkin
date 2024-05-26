//
//  ProductCameraView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 24/05/24.
//

import Foundation

import SwiftUI

struct ProductCameraView: View {
    
    let cameraService = CameraServices()
    
    @State var capturedImage: UIImage?
    @State var isCaptured = false
    
    
    var body: some View {
        ZStack{
            Color(.black)
            
            if(capturedImage != nil){
                VStack{
                    tempShowPhotoView(image: capturedImage!)
                    
                    Button(action: {
                        capturedImage = nil
                    }, label: {
                        TestButton(text: "reset")
                        
                    })
                }
            }
            else{
                CameraView(ratioX: 1.0, ratioY: 1.0, cameraServices: cameraService){ result in
                    switch result {
                        
                    case .success(let photo):
                        if let data = photo.fileDataRepresentation(){
                            capturedImage = UIImage(data: data)
//                            print(capturedImage!.size.width)
//                            capturedImage = cropImage(capturedImage!,  aspectRatio: 4/3, width: capturedImage!.size.width)
//                            capturedImage = crop(image: capturedImage!, to: 4/3)

                            isCaptured = true
                            
                        }
                        else{
                            print("Error: no image data found")
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                        
                    }
                }
                .padding(EdgeInsets( top: 0, leading: 0, bottom: 400, trailing: 0))
                
                VStack{
                    Spacer()
                    Button(action: {
                        cameraService.capturePhoto()

                        
                    }, label: {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                            .foregroundStyle(.white)
                    })
                    Spacer()
                        .frame(height: 28)
                }
                
            }
        }
//        .toolbar(.hidden, for: .tabBar)
    
        
        
        
        
    }
}

struct tempShowPhotoView : View {
    var image: UIImage
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
    }
}

#Preview{
    ProductCameraView()
}
