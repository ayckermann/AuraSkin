//
//  SwiftUIView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct SwiftUIView: View {
    
    var text: String = ""
    
    var body: some View {
        NavigationStack {
//            NavigationLink {
//                ProductDetailView()
//                    .toolbar(.visible, for: .tabBar)
//            } label: {
//                Text("CLICK DISINI BRADER")
//            }

            Menu {
                Button(action: test) {
                    Label("Edit", systemImage: "square.and.pencil")
                }
                Button(role: .destructive, action: test) {
                    Label("Delete", systemImage: "trash")
                }
                .foregroundColor(.red)
            } label: {
                Image(systemName: "ellipsis")
            }

            Menu {
                Button(action: test) {
                    Label("Duplicate item", systemImage: "doc.on.doc")
                }
                Button("Edit item", action: test)
                Menu {
                    Button("Open in Preview", action: test)
                    Button("Save as PDF", action: test)
                } label: {
                    Label("PDF", systemImage: "doc")
                }
                Button(role: .destructive, action: test) {
                    Label("Delete", systemImage: "trash")
                }
                .foregroundColor(.red)
            } label: {
                Image(systemName: "square.and.pencil")
            }
        }
    }

    func test() -> Void {}

    
}

#Preview {
    SwiftUIView()
}
