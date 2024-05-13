//
//  IngredientsEffectListComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct IngredientEffectList: View {
    @State var ingredients: [IngredientsEffect]
    @State var effectType: IngredientsEffectType
    @State private var isShowingSheet: Bool = false
    
    init( _ effectType: IngredientsEffectType, _ ingredients: [IngredientsEffect]) {
        self.ingredients = ingredients
        self.effectType = effectType
    }
    
    var body: some View {
        VStack {
            HStack {
                SectionTextLeading(getSectionTitle(effectType))
                SectionTextTrailing("(\(getTotalIngredients(ingredients)))")
            }.foregroundStyle(getSectionTitleColor(effectType))
            
            Divider()
                .frame(minHeight: 2)
                .background(.black)
            
            
            ForEach(ingredients, id: \.effect) { item in
                @State var data: IngredientsEffect = item
                
                HStack {
                    Image(systemName: item.symbol)
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    VStack {
                        Text(item.effect)
                            .font(.headline)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        Text(item.description)
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Text(String(item.count))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
                .onTapGesture {
                    isShowingSheet.toggle()
                }
                .sheet(isPresented: $isShowingSheet, content: {
                    AnalysisResultModalView(isShowingSheet: $isShowingSheet, data: $data)
                })
                
                Divider()
                .padding(.bottom)
            }
            
        }.padding(.top)
    }
    
    func getTotalIngredients(_ ingredients: [IngredientsEffect]) -> Int {
        var total: Int = 0
        
        for ingredient in ingredients {
            total += ingredient.count
        }
        
        return total
    }
    
    func getSectionTitle(_ effectType: IngredientsEffectType) -> String {
        switch effectType {
        case .pros:
            return "Pros"
        case .cons:
            return "Cons"
        }
    }
    
    func getSectionTitleColor(_ effectType: IngredientsEffectType) -> Color {
        switch effectType {
        case .pros:
            return Color.auraSkinPrimaryColor
        case .cons:
            return Color.auraSkinConsColor
        }
    }
}


#Preview {
    IngredientEffectList(IngredientsEffectType.pros, prosIngredients)
}
