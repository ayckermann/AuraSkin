//
//  InfoSkinView.swift
//  AuraSkin
//
//  Created by sri anggraini on 24/05/24.
//

import SwiftUI

struct InfoSkinView: View {
    var skinType: SkinType

    var skinTypeInfo: SkinTypeInfo?
    
    init(skinType: SkinType) {
        self.skinType = skinType
        
        SkinTypeInfoData.skinTypesData.forEach(){item in
            if(item.skinType == skinType){
                self.skinTypeInfo = item
            }
        }
        

    }
    
    var body: some View {
            ScrollView {
                VStack (alignment: .leading, spacing: 20){
                    Text("You Have \(skinTypeInfo!.skinType.description) Skin")
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                        .frame(maxWidth: .infinity, alignment: .center)
                    Image(skinTypeInfo!.imageSkin)
                        .resizable()
                        .frame(width:200, height: 200)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 20){
                        
                        Text("About Your Skin")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            
                        
                        Text(skinTypeInfo!.description)
                            
                           
                        
                        Text("Characteristic")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            
                    } .padding(.horizontal)
                    VStack( alignment: .leading, spacing: 10){
                        
                        if let characteristics = skinTypeInfo?.characteristics {
                            ForEach(characteristics.split(separator: ",").map { String($0) }, id: \.self) { characteristic in
                                CharacteristicView(text: characteristic.trimmingCharacters(in: .whitespaces))
                                
                            }
                        }
                    }.padding(.horizontal)
                    Spacer()
    //
    //                NavigationLink(destination: {
    //                    ViewController()
    //                        .navigationBarBackButtonHidden()
    //                }) {
    //                    Text("Next")
    //                        .foregroundColor(Color(red: 0.981, green: 0.981, blue: 0.981))
    //                        .frame(width: 359, height: 50)
    //                        .background(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
    //                        .font(.system(size: 20, weight: .bold, design: .default))
    //                        .cornerRadius(20)
    //                        .foregroundStyle(.white)
    //
    //                }
                    
                }
            }
            Spacer()
                
        
    }
}

#Preview {
    InfoSkinView(skinType: .oily)
}

struct CharacteristicView: View {
    var text: String

    var body: some View {
        VStack(){
            HStack {
                Image(systemName: "checkmark")
                    .foregroundColor(Color(red: 0.078, green: 0.365, blue: 0.4))
                Text(text)
            }
        }
       
    }
}


