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
                .ignoresSafeArea(.all)
            
            CameraView(ratioX: 9.0, ratioY: 16.0, cameraServices: cameraService){ result in
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
}

#Preview{
    ProductCameraView()
}
