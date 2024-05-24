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
    
    enum photoStateEnum {
        case noImage, image
    }

    @State private var photosPickerItem: PhotosPickerItem?
    @State private var photoState: photoStateEnum = .noImage

    @State var product: ProductModel
    
    var saveProductViewModel = SaveProductViewModel()

    var basicSkincare: [String] = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
    
    init(ingredients: String) {
        _product = State(initialValue: ProductModel(
            name: "",
            ingredients: ingredients,
            category: "Facial Wash",
            currentlyUsed: true,
            expiredDate: Date.now,
//            image: UIImage(named: "productImageDefault")?.pngData()  // binary
            imageName: "",
            image: UIImage(named: "productImageDefault")!
        ))
    }

    var body: some View {
        VStack {
            PhotosPicker(selection: $photosPickerItem, matching: .images) {
                switch photoState {
                    case .noImage:
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 55, height: 55)
                            .foregroundStyle(.gray)
                            .frame(width: 250, height: 235)
                            .overlay(RoundedRectangle(cornerRadius: 11).stroke(.gray))
                            .padding(.bottom)
                    case .image:
//                        Image(data: (product.image ?? UIImage(named: "productImageDefault")?.pngData())!)! // binary
                    Image(uiImage: product.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 235)
                            .foregroundColor(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .padding(.bottom)
                }
            }
                .onChange(of: photosPickerItem) { _, _ in
                    Task {
                        if let photosPickerItem,
                           let data = try? await photosPickerItem.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            product.image = uiImage
                            self.photoState = .image
                        }
                        photosPickerItem = nil
                    }
//                    Task {
//                        if let photosPickerItem,
//                           let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
//                            if UIImage(data: data) != nil {
//                                product.image = data
//                                self.photoState = .image
//                            }
//                        }
//                        photosPickerItem = nil
//                    }
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
                .tint(.accentColor)
                .padding([.leading, .trailing], 15)
                .overlay(RoundedRectangle(cornerRadius: 5).stroke(.gray, lineWidth: 1))
                .padding(.bottom)

            Button(action: {
                saveProductViewModel.saveProduct(context: viewContext, product: product)
                dismiss()
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
    SaveProductView(ingredients: "Sample ingredients")
}

