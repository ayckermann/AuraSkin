//
//  Ingredients.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation

// model example
struct Ingredients{
    
}

struct IngredientsEffect {
    var effect: String
    var description: String
    var symbol: String
    var count: Int
    
    init(effect: String, description: String, count: Int, symbol: String = "photo") {
        self.effect = effect
        self.description = description
        self.symbol = symbol
        self.count = count
    }
}

struct IngredientsAnalysisResponse: Decodable {
    var analysis: IngredientsAnalysis?
}

struct IngredientsAnalysis: Decodable {
    var totalIngredients: Int
    var harmful: HarmfulEffectIngredients
    var positive: PositiveEffectIngredients
    
    enum CodingKeys: String, CodingKey {
        case totalIngredients = "total_ingredients"
        case harmful
        case positive
    }
}

struct PositiveEffectIngredients: Decodable {
    var moisturising: PositiveEffect
    var softening: PositiveEffect
    var soothing: PositiveEffect
    var acneFighting: PositiveEffect
    var antiAging: PositiveEffect
    var antioxidant: PositiveEffect
    var healing: PositiveEffect
    var antiseptic: PositiveEffect
    var whitening: PositiveEffect
    var uvProtecting: PositiveEffect
    
    enum CodingKeys: String, CodingKey {
        case moisturising
        case softening
        case soothing
        case acneFighting = "acne_fighting"
        case antiAging = "anti_aging"
        case antioxidant
        case healing
        case antiseptic
        case whitening
        case uvProtecting = "uv_protecting"
    }
}

struct HarmfulEffectIngredients: Decodable {
    var allergen: HarmfulEffect
    var alcohol: HarmfulEffect
    var comedogenicRating: HarmfulEffect
    var gluten: HarmfulEffect
    var silicone: HarmfulEffect
    var sulfate: HarmfulEffect
    var paraben: HarmfulEffect
    var peg: HarmfulEffect
    var fungalAcneFeeding: HarmfulEffect
    var fragrance: HarmfulEffect
    
    enum CodingKeys: String, CodingKey {
        case allergen
        case alcohol
        case comedogenicRating = "comedogenic_rating"
        case gluten
        case silicone
        case sulfate
        case paraben
        case peg
        case fungalAcneFeeding = "fungal_acne_feeding"
        case fragrance
    }
}

struct PositiveEffect: Decodable {
    var title: String
    var description: String
    var imageUrl: String
    var list: [EffectList]
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageUrl = "image_url"
        case list
        case count
    }
}

struct HarmfulEffect: Decodable {
    var title: String
    var description: String
    var imageUrl: String
    var list: [EffectList]
    var count: Int
    var slug: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case imageUrl = "image_url"
        case list
        case count
        case slug
    }
}

struct EffectList: Decodable {
    var index: Int
    var title: String
    var alias: String
}
