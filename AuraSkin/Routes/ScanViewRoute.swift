//
//  ScanViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI
import Mantis

struct ScanViewRoute: View {
    
    let cameraService = CameraServices()
    
    @State var capturedImage: UIImage?
    @State var isCaptured = false
    @State var isCropped = false
    @State var isFlash = false
    @State var isHideInstruction = true
    
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .none
    
    func toggleFlash() {
        
        isFlash = self.cameraService.toggleFlash()
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.black)
                    .ignoresSafeArea(.all)
                
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
                .ignoresSafeArea(.all)
                
                ZStack{
                    Rectangle()
                        .padding(.bottom, 5)
                        .padding(.top, 5)
                        .foregroundStyle(.grayOverlay)
                    RoundedRectangle(cornerRadius: 20)
                        .padding(.top, 10)
                        .frame(height: 430)
                        .foregroundStyle(.opacity(1))
                        .blendMode(.destinationOut)
                }
                .compositingGroup()
                .coordinateSpace(name: "camerabox")
                
                
                ScanView(captureFunction: {
                    cameraService.capturePhoto()
                }, flashFunction: {
                    toggleFlash()
                }, selectedImage: $capturedImage, isSelected: $isCaptured, isFlash: $isFlash)
                
                
                if !isHideInstruction {
                    ScanInstructionView()
                }
                
            }
            .onAppear {
                if(skinTypePersistance == .none){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.isHideInstruction = false
                    }
                    
                }
            }
            .navigationDestination(isPresented: $isCaptured) {
                if isCaptured{
                    
                    ZStack{
                        
                        ImageCropper(image: $capturedImage) { croppedImage in
                            // Handle the cropped image
                            isCropped = true
                            
                        } onImageCropCancelled: {
                            // Handle cancellation
                            isCropped = false
                            isCaptured = false
                            capturedImage = nil
                        }
                        .ignoresSafeArea(.all)
                        .navigationBarBackButtonHidden(true)
                        .toolbar(.hidden, for: .tabBar)
                        .preferredColorScheme(.dark)
                        
                    }
                    
                    
                    
                }
                
                
                
                
            }
            
            .navigationDestination(isPresented: $isCropped) {
                if isCropped{
                    TypoCheckRoute(image: capturedImage)
                    
                }
            }
            
        }
//        .ignoresSafeArea(.all)
        
//        .environment(\.colorScheme, .dark)
//        .preferredColorScheme(.dark)
//        .toolbarColorScheme(.dark, for: .bottomBar)
//        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .tabBar)


        
        
    }
}

//#Preview {
//    ScanViewModel()
//}
