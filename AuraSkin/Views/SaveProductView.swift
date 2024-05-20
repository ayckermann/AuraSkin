//
//  SaveProductView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 19/05/24.
//

import SwiftUI

struct SaveProductView: View {
    @State var productName: String = ""
    @State var skincareCategory: String = "Facial Wash"
    @State var expiredDate: Date = Date.now
    @State var currentlyUsed: Bool = true

    @Environment(\.dismiss) var dismiss

    var basicSkincare: [String] = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.gray)
            }
            .frame(width: 250, height: 235)
            .overlay(RoundedRectangle(cornerRadius: 11).stroke(.gray, lineWidth: 1))
            .padding(.bottom)
            .onTapGesture {
                // launch camera view
            }

            SectionTextLeading("Product's Name")
                .foregroundStyle(Color(UIColor.darkGray))
            TextFieldComponents(text: $productName, localizedStringKey: "product's name",  prompt: "product's name")
                .padding(.bottom)

            SectionTextLeading("Basic Skincare Category")
                .foregroundStyle(Color(UIColor.darkGray))
            DropdownComponent(selectedOption: $skincareCategory, title: "Category", items: basicSkincare)
                .padding(.bottom)

            SectionTextLeading("Expired Date")
                .foregroundStyle(Color(UIColor.darkGray))
            DatePickerComponent(expiredDate: $expiredDate)
                .padding(.bottom)


            Toggle("Currently used", isOn: $currentlyUsed)
                .frame(height: 45)
                .tint(Color.auraSkinPrimaryColor)
                .padding([.leading, .trailing], 15)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                .padding(.bottom)

            TestButton(text: "Save")
        }
        .navigationTitle("Add Product")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .padding(.top, 10)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                    Text("Cancel")
                }
                .foregroundStyle(Color.auraSkinPrimaryColor)
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    SaveProductView()
}
