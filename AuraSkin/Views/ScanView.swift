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
    var flashFunction: () -> Void?

    @State var photosPickerItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    
    @Binding var isSelected: Bool
//    @State var isClickCapture: Bool = false
    @Binding var isFlash: Bool
    
    // for show modal input manual
    
    @State private var show_modal_input_manual: Bool = false

    
    
    var body: some View {
        
        VStack{
            
            HStack(){
                Spacer()
                Button(action: {
                    flashFunction()
                    isFlash.toggle()

                }, label: {
                    Image(systemName: isFlash ? "bolt.fill" : "bolt.slash.fill")
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
                        
                        photosPickerItem = nil
                        
                    }
                }
                
                
                Spacer()
                Button(action: {
                    captureFunction()
                    if(isFlash){
                        flashFunction()
                        isFlash.toggle()
                    }
                    
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 96))
                })
                
                Spacer()
                
                NavigationLink {
                    InputIngredientsManualView()
                } label: {
                    Image(systemName: "keyboard")
                        .font(.system(size: 33))
                }
                
                Spacer()
                
                
            }
            
            Spacer()
                .frame(height: 50)
            
        }
        .foregroundStyle(.white)
        
        
    }
    
}

//#Preview {
//        ScanView(captureFunction: testButton, navManualInputFunction: testButton, flashFunction: testButton)
//}
