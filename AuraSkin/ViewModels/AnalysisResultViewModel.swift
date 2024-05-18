//
//  AnalysisResultController.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import Foundation
import SwiftUI

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.width
}

extension String {
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}

class AnalysisResultViewModel {
    
//    init(){
//        getTags()
//        
//    }
    
    func getTags(ingredients: String) -> [[Tag]] {
        var tagRows: [[Tag]] = []
        var tags: [Tag] = []

        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth = UIScreen.screenWidth - 10
        let tagSpaceing: CGFloat = 14 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
        
        
        var modifiedStringCaseInsensitive = ingredients.replacingOccurrences(of: "ingredients:", with: "", options: .caseInsensitive)
        
        modifiedStringCaseInsensitive = modifiedStringCaseInsensitive.replacingOccurrences(of: ".", with: ", ", options: .caseInsensitive)

        for ingredient in modifiedStringCaseInsensitive.split(separator: ", ") {
            tags.append(Tag(name: String(ingredient)))
        }
        
        if !tags.isEmpty{
            
            for index in 0..<tags.count{
                tags[index].size = tags[index].name.getSize()
            }
            
            tags.forEach{ tag in
                
                totalWidth += (tag.size + tagSpaceing)
                
                if totalWidth > screenWidth{
                    totalWidth = (tag.size + tagSpaceing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                }else{
                    currentRow.append(tag)
                }
            }
            
            if !currentRow.isEmpty{
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            tagRows = rows
        } else {
            tagRows = []
        }

        return tagRows
    }

    func getProsIngredients(data: IngredientsAnalysisResponse) -> [IngredientsEffect] {
        var ingredientsEffect: [IngredientsEffect] = []

        if let moisturising = data.analysis?.positive.moisturising, moisturising.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: moisturising.title, description: moisturising.description, count: moisturising.count))
        }

        if let softening = data.analysis?.positive.softening, softening.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: softening.title, description: softening.description, count: softening.count))
        }

        if let soothing = data.analysis?.positive.soothing, soothing.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: soothing.title, description: soothing.description, count: soothing.count))
        }

        if let acneFighting = data.analysis?.positive.acneFighting, acneFighting.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: acneFighting.title, description: acneFighting.description, count: acneFighting.count))
        }

        if let antiAging = data.analysis?.positive.antiAging, antiAging.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: antiAging.title, description: antiAging.description, count: antiAging.count))
        }

        if let antioxidant = data.analysis?.positive.antioxidant, antioxidant.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: antioxidant.title, description: antioxidant.description, count: antioxidant.count))
        }

        if let healing = data.analysis?.positive.healing, healing.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: healing.title, description: healing.description, count: healing.count))
        }

        if let antiseptic = data.analysis?.positive.antiseptic, antiseptic.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: antiseptic.title, description: antiseptic.description, count: antiseptic.count))
        }

        if let whitening = data.analysis?.positive.whitening, whitening.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: whitening.title, description: whitening.description, count: whitening.count))
        }

        if let uvProtecting = data.analysis?.positive.uvProtecting, uvProtecting.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: uvProtecting.title, description: uvProtecting.description, count: uvProtecting.count))
        }

        return ingredientsEffect
    }

    func getConsIngredients(data: IngredientsAnalysisResponse) -> [IngredientsEffect] {
        var ingredientsEffect: [IngredientsEffect] = []

        if let allergen = data.analysis?.harmful.allergen, allergen.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: allergen.title, description: allergen.description, count: allergen.count))
        }

        if let alcohol = data.analysis?.harmful.alcohol, alcohol.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: alcohol.title, description: alcohol.description, count: alcohol.count))
        }

        if let comedogenic = data.analysis?.harmful.comedogenicRating, comedogenic.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: comedogenic.title, description: comedogenic.description, count: comedogenic.count))
        }

        if let gluten = data.analysis?.harmful.gluten, gluten.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: gluten.title, description: gluten.description, count: gluten.count))
        }

        if let silicone = data.analysis?.harmful.silicone, silicone.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: silicone.title, description: silicone.description, count: silicone.count))
        }

        if let sulfate = data.analysis?.harmful.sulfate, sulfate.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: sulfate.title, description: sulfate.description, count: sulfate.count))
        }

        if let paraben = data.analysis?.harmful.paraben, paraben.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: paraben.title, description: paraben.description, count: paraben.count))
        }

        if let peg = data.analysis?.harmful.peg, peg.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: peg.title, description: peg.description, count: peg.count))
        }

        if let fungalAcneFeeding = data.analysis?.harmful.fungalAcneFeeding, fungalAcneFeeding.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: fungalAcneFeeding.title, description: fungalAcneFeeding.description, count: fungalAcneFeeding.count))
        }

        if let fragrance = data.analysis?.harmful.fragrance, fragrance.count != 0 {
            ingredientsEffect.append(IngredientsEffect(effect: fragrance.title, description: fragrance.description, count: fragrance.count))
        }



        return ingredientsEffect
    }
}
