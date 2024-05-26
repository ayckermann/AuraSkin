//
//  SplashScreenView.swift
//  AuraSkin
//
//  Created by sri anggraini on 26/05/24.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack{
            Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Image("logo")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 89, height: 75)
                Text("Aurora")
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 24))
                
            }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
