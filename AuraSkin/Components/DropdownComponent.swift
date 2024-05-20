//
//  DropdownComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 19/05/24.
//

import SwiftUI

struct DropdownComponent: View {
    @Binding var selectedOption: String
    let title: String
    let items: [String]

    var body: some View {
        HStack {
            Text(title)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 15)

            Picker("Category", selection: $selectedOption) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }.tint(.gray)
        }
        .foregroundColor(.gray)
        .frame(height: 45)
        .overlay(
            RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1)
        )
    }
}

#Preview {
    @State var skincareCategory: String = "Facial Wash"

    return DropdownComponent(selectedOption: $skincareCategory, title: "Test", items: ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"])
}
