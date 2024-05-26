//
//  ProductCardView.swift
//  AuraSkin
//
//  Created by Risma Harby on 23/05/24.
//

import SwiftUI

struct ProductCardView: View {
    var product: Product
    
    // send product
    
    @State private var navigateToDetail = false
    
    var body: some View {
        NavigationLink(destination: {
            ProductDetailView(product: product)
                .toolbar(.visible, for: .tabBar)
        }) {
            VStack {
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 5, y: 0)
                        .frame(width: 177, height: 188)
                    
                    
                    VStack {
                        if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 154, height: 120)
                                .cornerRadius(10)
                                .offset(y: -20)
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 154, height: 120)
                                .cornerRadius(10)
                                .offset(y: -20)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Spacer().frame(height: 1)
                            Text(product.category ?? "")
                                .font(.system(size: 15, weight: .light))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 20)
                            
                            Text(product.name ?? "")
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
        .buttonStyle(PlainButtonStyle())
    }
}

//#Preview {
//    ProductCardView(name: "Curology Facial Wash", category:"Face Wash", imageName: <#Data#>, imageName: )
//}
