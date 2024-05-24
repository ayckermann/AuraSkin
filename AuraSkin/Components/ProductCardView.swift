//
//  ProductCardView.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import SwiftUI

struct ProductCardView: View {
    var name: String
    var category: String
    var imageName: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 0)
                    .frame(width: 177, height: 188)
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 154, height: 120)
                        .cornerRadius(10)
                        .offset(y: -20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Spacer().frame(height: 1)
                        Text(category)
                            .font(.system(size: 15, weight: .light))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                        
                        Text(name)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 20)
                    }
                    .padding(.top, -30)
                    .padding(.bottom, 10)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProductCardView(name: "Curology Facial Wash", category:"Face Wash", imageName: "unsplash_p3O5f4u95Lo")
}
