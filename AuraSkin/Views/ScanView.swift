//
//  ScanView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI
import PhotosUI

struct ScanView: View {
    
    var captureFunction : () -> Void
    var navManualInputFunction : () -> Void?
    
    @State var photosPickerItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    @Binding var isSelected: Bool
    
    @State var isClickCapture: Bool = false
    @State var isFlash: Bool = false
    
    
    var body: some View {
        
        VStack{
            
            HStack(){
                Spacer()
                Button(action: {
                    isFlash.toggle()
                }, label: {
                    Image(systemName: isFlash ? "bolt.slash.fill" : "bolt.fill")
                        .font(.system(size: 26))
                    
                })
                Spacer()
                    .frame(width: 35)
            }
            
            Spacer()
            
            HStack(){
                Spacer()
                PhotosPicker(selection: $photosPickerItem, matching: .images)
                {
                    Image(systemName: "photo.stack")
                        .font(.system(size: 33))
                    
                }.onChange(of: photosPickerItem) { _, _ in
                    Task{
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self)
                        {
                            if let image = UIImage(data: data){
                                selectedImage = image
                                isSelected = true
                            }
                        }
                    }
                }
                
                
                Spacer()
                Button(action: {
                    isClickCapture.toggle()
                    captureFunction()
                    
                }, label: {
                    Image(systemName: isClickCapture ? "circle.fill" : "circle")
                        .font(.system(size: 75))
                })
                
                Spacer()
                Button(action: {
                    navManualInputFunction()
                }, label: {
                    Image(systemName: "keyboard")
                        .font(.system(size: 33))
                })
                Spacer()
                
                
            }
            
            Spacer()
                .frame(height: 30)
            
        }
        .foregroundStyle(.white)
        
        
    }
    
}

//#Preview {
//    ScanView(captureFunction: testButton, navGalleryFunction: testButton, navManualInputFunction: testButton)
//}
