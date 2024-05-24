//
//  SaveProductView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 19/05/24.
//

import SwiftUI
import PhotosUI

struct SaveProductView: View {
    // MARK: Core data
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) var viewContext
    
    @Environment(\.dismiss) var dismiss
    
    @State var product: ProductModel = ProductModel(name: "", ingredients: "ingredients", category: "Facial Wash", currentlyUsed: true, expiredDate: Date.now, image: UIImage(named: "productImageDefault")?.pngData())
    
    @State private var photosPickerItem: PhotosPickerItem?
    var saveProductViewModel = SaveProductViewModel()

    var basicSkincare: [String] = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]

    var body: some View {
        VStack {
            VStack {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .foregroundColor(.gray)
                PhotosPicker(selection: $photosPickerItem, matching: .images){
                    Image(uiImage: UIImage(data: product.image ?? UIImage(named: "productImageDefault")!.pngData()!) ?? UIImage(named: "productImageDefault")!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                }
            }
            .frame(width: 250, height: 235)
            .overlay(RoundedRectangle(cornerRadius: 11).stroke(.gray, lineWidth: 1))
            .padding(.bottom)
            .onTapGesture {
                // launch camera view
            }
            .onChange(of: photosPickerItem) { _, _ in
                Task {
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: data) {
                            product.image = data
                        }
                    }
                    photosPickerItem = nil
                }
            }

            SectionTextLeading("Product's Name")
                .foregroundStyle(Color(UIColor.darkGray))

            TextFieldComponents(text: $product.name, localizedStringKey: "product's name", prompt: "product's name")
                .padding(.bottom)

            SectionTextLeading("Basic Skincare Category")
                .foregroundStyle(Color(UIColor.darkGray))
            DropdownComponent(selectedOption: $product.category, title: "Category", items: basicSkincare)
                .padding(.bottom)

            SectionTextLeading("Expired Date")
                .foregroundStyle(Color(UIColor.darkGray))
            DatePickerComponent(expiredDate: $product.expiredDate)
                .padding(.bottom)

            Toggle("Currently used", isOn: $product.currentlyUsed)
                .frame(height: 45)
                .tint(Color.auraSkinPrimaryColor)
                .padding([.leading, .trailing], 15)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                .padding(.bottom)

            Button(action: {
                saveProductViewModel.saveProduct(context: viewContext, product: product)
            }, label: {
                TestButton(text: "Save")
            })
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

