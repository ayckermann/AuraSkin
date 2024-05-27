
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
    var flashFunction: () -> Void?
    
    @State var photosPickerItem: PhotosPickerItem?
    @Binding var selectedImage: UIImage?
    
    @Binding var isSelected: Bool
    @Binding var isFlash: Bool
    
    
    
    var body: some View {
        
        VStack{
            VStack {
                HStack(){
                    Spacer()
                    Button(action: {
                        flashFunction()
                        isFlash.toggle()
                        
                    }, label: {
                        Image(systemName: isFlash ? "bolt.fill" : "bolt.slash.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 26, height: 26)
                        
                    })
                    Spacer()
                        .frame(width: 35)
                }
                .padding(.top, 15)
                
                Text("Scan Ingredients")
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: 16)
                Text("Place text inside the frame and keep\nyour device steady")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15))
                    .fontWeight(.regular)
                
                Spacer()
                    .frame(height: 16)
                
            }
            
            Spacer()
            
            HStack(){
                Spacer()
                PhotosPicker(selection: $photosPickerItem, matching: .images)
                {
                    Image(systemName: "photo.stack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33)
                    
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
                .coordinateSpace(name: "photospicker")
                
                Spacer()
                
                
                
                Button(action: {
                    captureFunction()
                    if(isFlash){
                        flashFunction()
                        isFlash.toggle()
                    }
                    
                }, label: {
                    Image(systemName: "circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75)
                })
                
                Spacer()
                NavigationLink {
                    InputIngredientsManualView()
                        .environment(\.colorScheme, .light)

                } label: {
                    Image(systemName: "keyboard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33)

                }
                .coordinateSpace(name: "manualbutton")
                
                Spacer()
                
                
            }
            .padding(.vertical, 30)
        }
        .foregroundStyle(.white)
        
        
        
        
        
        
    }
    
    
}




#Preview {
    ScanView(captureFunction: testButton, flashFunction: testButton, selectedImage: .constant(UIImage(systemName: "xmark")), isSelected: .constant(false), isFlash: .constant(false)  )
}
