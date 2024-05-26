//
//  ProductCardMiniView.swift
//  AuraSkin
//
//  Created by Risma Harby on 24/05/24.
//

import SwiftUI

struct ProductCardMiniView: View {
    // Add context
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    var product: Product
    
    var body: some View {
        VStack {
            NavigationLink(destination: {
                ProductDetailView(product: product, context: viewContext)
                    .toolbar(.visible, for: .tabBar)
            }) {
                ZStack(alignment: .bottom) {
                    RoundedRectangle(cornerRadius: 11)
                        .fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .frame(width: 116, height: 130)
                    
                    VStack {
                        if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 86)
                                .cornerRadius(10)
                                .padding(.top, 10)
                        } else {
                            Image(uiImage: UIImage(data: product.image ?? Data())!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 86)
                                .cornerRadius(10)
                                .padding(.top, 10)
                        }
                        
                        Spacer()
                        VStack(alignment: .center) {
                            Text(product.name ?? "")
                                .font(.system(size: 12, weight: .medium))
                                .frame(maxWidth: 99, alignment: .center)
                                .lineLimit(2)
                                .truncationMode(.tail)
                        }
                        .padding(.top, -28)
                    }
                }
                
                .padding()
                .frame(maxHeight: 150)
            }
            .buttonStyle(PlainButtonStyle())
            
        }
    }
}

//#Preview {
//    ProductCardMiniView(name: "yrdy yrdy yrdy yrdy yrdy", imageName: "unsplash_p3O5f4u95Lo")
//}
