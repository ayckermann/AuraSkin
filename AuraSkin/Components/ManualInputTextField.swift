//
//  ManualInputTextField.swift
//  AuraSkin
//
//  Created by sri anggraini on 25/05/24.
//

import SwiftUI

struct ManualInputTextField: View {
    var model = AnalysisResultViewModel()
    
    @State private var tags: [Tag] = []
    @State private var newTagName: String
    @State private var availableWidth: CGFloat = 0
    @State private var elementsSize: [String: CGSize] = [:]
    
    //    @State private var allIngredients = "Coconut Oil, ,"
    
    //    tags.map { $0.name }.joined(separator: ", ")
    
    init(ingredients: String){
        newTagName = ingredients.appending(", ")
        processInput()
        
    }
    
    let columns = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),


    ]
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(alignment: .center, spacing: 1) {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 1)], alignment: .leading, spacing: 10){
                        ForEach(tags) { tag in
                            IngredientTag(tag.name)
                                .overlay(
                                    Button(action: {
                                        if let index = tags.firstIndex(where: { $0.id == tag.id }) {
                                            tags.remove(at: index)
                                        }
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.white)
                                            .padding(.leading, 10)
                                    },
                                    alignment: .trailing
                                    
                                )
                        }
                        .frame(height: 28)
                        .padding(.bottom, 10)
                        
                    }
                    TextEditor(text: $newTagName)
                        .padding(1)
                        .background(Color.white)
                        .disableAutocorrection(true)
                    //                        .foregroundColor(Color(.systemBackground))
                        .foregroundColor(.black)

                        .onChange(of: newTagName) {
                            processInput()
                        }
                        .onAppear(){
                            processInput()
                        }

                }
                .padding()
                .frame(minHeight: 250, maxHeight: .infinity)
                .background(Color(.white))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)                /*.background(.white)*/

                )
                .foregroundStyle(.black)
                .background(.white)
                
                
                
            }
//            .frame(height: 250)
            .padding(.bottom)

            
        }
        Spacer()
        
        NavigationLink {
            let allIngredients = tags.map { $0.name }.joined(separator: ", ")
            AnalysisResultView(ingredients: "\(allIngredients)")
                .toolbar(.visible, for: .tabBar)
        } label: {
            TestButton(text: "Analyze")
        }
    }
    
    private func processInput() {
        let components = newTagName.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        if components.count > 1 {
            for component in components.dropLast() {
                if !component.isEmpty {
                    let newTag = Tag(name: component)
                    tags.append(newTag)
                }
            }
            newTagName = components.last ?? ""
            
        }
        
        
    }
}

#Preview {
    ManualInputTextField(ingredients: "Water, Glycerin, Dicaprylyl Ether, Butylene Glycol, Hydrogenated Ethylhexyl Olivate, Pentylene Glycol, 2-HexanedioL, Hydrogenated Polydecene, saccharide isomerate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Polymethylsilsesquioxane, Hydrogenated Olive Oil Unsaponifiables, Boron Nitride, Madecassoside, Aloe Barbadensis Leaf Extract, Allantoin, Artemisia Vulgaris Extract, Astrocaryum Murumuru Seed Butter, Glyceryl Acrylate/Acrylic Acid Copolymer, Tromethamine, Ethylhexylglycerin, Xanthan Gum, Dipotassium Glycyrrhizate, Sodium Phytate, Ceramide NP, Sodium Citrate, Citric Acid, Sea Water, Propanediol, Tocopherol, Emiliania Huxleyi Extract, Shea Butter")
}
