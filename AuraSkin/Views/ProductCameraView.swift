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
    @Environment(\.dismiss) var dismiss
    
    @Binding var capturedImage: Data?
    @State var isFlash: Bool = false
    
    
    
    var body: some View {
        ZStack{
            Color(.black)
                .aspectRatio(9/16, contentMode: .fit)
            
            
            CameraView(ratioX: 9.0, ratioY: 16.0, yOffset: CGFloat(90.0), cameraServices: cameraService){ result in
                switch result {
                    
                case .success(let photo):
                    if let data = photo.fileDataRepresentation(){
                        capturedImage = data
                        self.dismiss()
                    }
                    else{
                        print("Error: no image data found")
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
                }
            }
            //            .padding(EdgeInsets( top: 0, leading: 0, bottom: 400, trailing: 0))
            .ignoresSafeArea(.all)
            
            ZStack{
                ZStack{
                    Rectangle()
                    //                        .padding(.bottom, 5)
                    //                        .padding(.top, 5)
                        .foregroundStyle(.grayOverlay)
                    RoundedRectangle(cornerRadius: 20)
                    //                        .padding(.top, 10)
                        .aspectRatio(1.06382979, contentMode: .fit)
                        .foregroundStyle(.opacity(1))
                        .blendMode(.destinationOut)
                }
                .compositingGroup()
                //            .padding(EdgeInsets( top: 0, leading: 0, bottom: 68, trailing: 0))
                
                VStack{
                    Spacer()
                        .frame(height: 15)
                    HStack {
                        Spacer()
                            .frame(width: 35)
                        Button(action: {
                            self.dismiss()
                            capturedImage = nil
                            
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                        })
                        Spacer()
                            .frame(width: 35)
                        Spacer()
                        Button(action: {
                            
                            toggleFlash()
                            isFlash.toggle()
                            
                        }, label: {
                            Image(systemName: isFlash ? "bolt.fill" : "bolt.slash.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                                .frame(minWidth: 26, maxWidth: 26, minHeight: 26, maxHeight: 26)
                            
                        })
                        Spacer()
                            .frame(width: 35)
                    }
                    
                    Spacer()
                    Button(action: {
                        cameraService.capturePhoto()
                        
                        
                    }, label: {
                        Image(systemName: "circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                    })
                    Spacer()
                        .frame(height: 30)
                }
                //            .padding(EdgeInsets( top: 0, leading: 0, bottom: 68, trailing: 0))
                
                .foregroundStyle(.white)
            }
            .aspectRatio(9/16, contentMode: .fit)
        }
        .onDisappear {
            cameraService.resetCamera()
        }
        
    }
    
    
    func toggleFlash() {
        
        isFlash = self.cameraService.toggleFlash()
    }
    
    
    
}


#Preview{
    ProductCameraView( capturedImage: .constant(UIImage(contentsOfFile: "dry")?.pngData()))
}
