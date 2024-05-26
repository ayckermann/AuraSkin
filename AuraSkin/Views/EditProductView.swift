//
//  SaveProductView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 26/05/24.
//

import SwiftUI
import PhotosUI
import CoreData

struct EditProductView: View {
    // MARK: Core data
//    @EnvironmentObject var manager: CoreDataManager
//    @Environment(\.managedObjectContext) var viewContext
    enum photoStateEnum {
        case noImage, image
    }
    
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var photoState: photoStateEnum = .noImage
    
    @Binding var context: NSManagedObjectContext
    @Binding var product: Product
    @Binding var isPresentedEdit: Bool
    
    var saveProductViewModel = SaveProductViewModel()
    
    var basicSkincare: [String] = ["Facial Wash", "Toner", "Moisturizer", "Sunscreen"]
    @State var category: String = "Facial Wash"
    @State var expiredDate: Date = Date()
    
    
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
                        .frame(width: 215, height: 200)
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(.gray))
                        .padding(.bottom)
                case .image:
                    if let imageData = product.image, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 215, height: 200)
                            .foregroundColor(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .padding(.bottom)
                    } else {
                        Image("productImageDefault")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 215, height: 200)
                            .foregroundColor(.gray)
                            .clipShape(RoundedRectangle(cornerRadius: 11))
                            .padding(.bottom)
                    }
                }
            }
            .onChange(of: photosPickerItem) { _, _ in
                Task {
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        if UIImage(data: data) != nil {
                            product.image = data
                            self.photoState = .image
                        }
                    }
                    photosPickerItem = nil
                }
            }
            
            
            SectionTextLeading("Product's Name")
                .foregroundStyle(Color(UIColor.darkGray))
            
            TextFieldComponents(text: $product.name.unwrapped, localizedStringKey: "product's name", prompt: "product's name")
                .padding(.bottom)
            
            SectionTextLeading("Basic Skincare Category")
                .foregroundStyle(Color(UIColor.darkGray))
            DropdownComponent(selectedOption: $category, title: "Category", items: basicSkincare)
                .padding(.bottom)
                .onChange(of: category){
                    Task {
                        product.category = category
                    }
                }
            
            SectionTextLeading("Expired Date")
                .foregroundStyle(Color(UIColor.darkGray))
            DatePickerComponent(expiredDate: $expiredDate)
                .padding(.bottom)
                .onChange(of: expiredDate){
                    product.expiredDate = expiredDate
                }
            
            ToggleComponent(text: "Currently used", isOn: $product.currentlyUsed)
            
            Button(action: {
                edit()
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
                    isPresentedEdit = false
                } label: {
                    Image(systemName: "chevron.left")
                    Text("Cancel")
                }
                .foregroundStyle(Color.auraSkinPrimaryColor)
            }
        }
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            category = product.category ?? ""
            expiredDate = product.expiredDate ?? Date()
            
            if(product.image != nil){
                photoState = photoStateEnum.image
            }
        }
    }
    
    private func edit() {
        saveProductViewModel.updateProduct(context: context, product: product)
        isPresentedEdit = false
    }

}

//#Preview {
//    EditProductView(ingredients: "Sample ingredients")
//}

