//
//  InputIngredientsManualView.swift
//  AuraSkin
//
//  Created by Risma Harby on 17/05/24.
//

import SwiftUI

struct InputIngredientsManualView: View {
    
    @State private var tags: [Tag] = []
    @State private var newTagName: String = ""
    @State private var availableWidth: CGFloat = 0
    @State private var elementsSize: [String: CGSize] = [:]
    @State private var ingredientsName: String = {
           let dummyNames = ["Alice", "Bob", "Charlie", "Diana", "Eve"]
           return dummyNames.randomElement() ?? ""
       }()
    
    private let dummyNames: [String] = ["Alice", "Bob", "Charlie", "Diana", "Eve"]

    var model = AnalysisResultViewModel()
    @State private var navigate  = false
    
    let columns = [
          GridItem(.flexible(), spacing: 6),
          GridItem(.flexible(), spacing: 6)
      ]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                SectionTextLeading("Ingredients")
                    .foregroundColor(Color.auraSkinPrimaryColor)
            }
            
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
                        .disableAutocorrection(true)
//                        .foregroundColor(Color(.systemBackground))
                        .foregroundColor(.black)
                        .onChange(of: newTagName) {
                            processInput()
                        }
                }.padding()
                 .frame(minHeight: 250, maxHeight: .infinity)
                 .background(Color(.systemBackground))
                                   .overlay(
                                       RoundedRectangle(cornerRadius: 10)
                                           .stroke(Color.gray, lineWidth: 1)
                                   )
                               }
            .frame(height: 250)
            .padding(.bottom)

            
            Text("*Please note, each ingredient will be separated by a comma.")
                .font(.footnote)
                .foregroundColor(.gray)
            Spacer()
            
            // here is the view load the data ingredients based on recomendation
             
//            if !dummyNames.isEmpty {
//                ScrollView(.horizontal) {
//                    HStack {
//                        ForEach(dummyNames, id: \.self) { name in
//                            IngredientTag(name)
//                        }
//                    }
//                }
//            }
        }
        .padding()
    
        NavigationLink {
            let allIngredients = tags.map { $0.name }.joined(separator: ", ")
            AnalysisResultView(ingredients: "\(allIngredients)")
              .toolbar(.visible, for: .tabBar)
        } label: {
            TestButton(text: "Analyze")
                           .padding()
                           .disabled(tags == [])
                           .opacity(tags == [] ? 0.45 : 1)
                           
        }
    }
    
    // example function for print
    private func printAllIngredients() {
        let allIngredients = tags.map { $0.name }.joined(separator: ", ")
        print("Ingredients: \(allIngredients)")
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
    InputIngredientsManualView()
}
