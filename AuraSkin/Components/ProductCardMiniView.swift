//
//  ProductCardMiniView.swift
//  AuraSkin
//
//  Created by Risma Harby on 24/05/24.
//

import SwiftUI

struct ProductCardMiniView: View {
    var name: String
    var imageName: String
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RoundedRectangle(cornerRadius: 11)
                    .fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255))
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 0)
                    .frame(width: 116, height: 130)
                
                VStack {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 86)
                        .listStyle(.plain)
                        .cornerRadius(10)
                        .padding(.top, 10)
                    
                    Spacer()
                    VStack(alignment: .center) {
                        Text(name)
                            .font(.system(size: 12, weight: .medium))
                            .frame(maxWidth: 99, alignment: .center)
                            .lineLimit(2)
                            .truncationMode(.tail)
                    }
                    .padding(.top, -28)
                }
            }
        }
        .padding()
        .frame(maxHeight: 150)
    }
}

#Preview {
    ProductCardMiniView(name: "yrdy yrdy yrdy yrdy yrdy", imageName: "unsplash_p3O5f4u95Lo")
}
