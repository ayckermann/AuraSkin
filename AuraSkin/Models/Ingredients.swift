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

struct IngredientsEffect: Hashable {
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
    var ingredientsTable: [IngredientsTable]

    enum CodingKeys: String, CodingKey {
        case harmful, positive
        case totalIngredients = "total_ingredients"
        case ingredientsTable = "ingredients_table"
    }
}

struct PositiveEffectIngredients: Decodable {
    var moisturising: PositiveEffect?
    var softening: PositiveEffect?
    var soothing: PositiveEffect?
    var acneFighting: PositiveEffect?
    var antiAging: PositiveEffect?
    var antioxidant: PositiveEffect?
    var healing: PositiveEffect?
    var antiseptic: PositiveEffect?
    var whitening: PositiveEffect?
    var uvProtecting: PositiveEffect?

    enum CodingKeys: String, CodingKey {
        case moisturising, softening, soothing, antioxidant, healing, antiseptic, whitening
        case acneFighting = "acne_fighting"
        case antiAging = "anti_aging"
        case uvProtecting = "uv_protecting"
    }
}

struct HarmfulEffectIngredients: Decodable {
    var allergen: HarmfulEffect?
    var alcohol: HarmfulEffect?
    var comedogenicRating: HarmfulEffect?
    var gluten: HarmfulEffect?
    var silicone: HarmfulEffect?
    var sulfate: HarmfulEffect?
    var paraben: HarmfulEffect?
    var peg: HarmfulEffect?
    var fungalAcneFeeding: HarmfulEffect?
    var fragrance: HarmfulEffect?
    
    enum CodingKeys: String, CodingKey {
        case allergen, alcohol, gluten, silicone, sulfate, paraben, peg, fragrance
        case comedogenicRating = "comedogenic_rating"
        case fungalAcneFeeding = "fungal_acne_feeding"
    }
}

struct IngredientsTable: Decodable {
    var alias: String?
    var booleanProperties: BooleanProperties?
    var categories: String?
    var cirRating: String?
    var ewg: Ewg?
    var id: Int32?
    var integerProperties: IntegerProperties?
    var introtext: String?
    var title: String?

    enum CodingKeys: String, CodingKey {
        case alias, categories, ewg, id, introtext, title
        case booleanProperties = "boolean_properties"
        case cirRating = "cir_rating"
        case integerProperties = "integer_properties"
    }
}

struct BooleanProperties: Decodable {
    var acneFighting: Bool?
    var aha: Bool?
    var alcohol: Bool?
    var allergen: Bool?
    var antiAging: Bool?
    var antioxidant: Bool?
    var antiseptic: Bool?
    var badForDrySkin: Bool?
    var badForOilySkin: Bool?
    var badForSensitiveSkin: Bool?
    var bha: Bool?
    var ceramide: Bool?
    var fragrance: Bool?
    var fungalAcneFeeding: Bool?
    var gluten: Bool?
    var goodForDrySkin: Bool?
    var goodForOilySkin: Bool?
    var goodForSensitiveSkin: Bool?
    var healing: Bool?
    var hyaluronicAcid: Bool?
    var moisturising: Bool?
    var niacinamide: Bool?
    var paraben: Bool?
    var peg: Bool?
    var pha: Bool?
    var retinoid: Bool?
    var silicone: Bool?
    var softening: Bool?
    var soothing: Bool?
    var sulfate: Bool?
    var uvProtecting: Bool?
    var vitamin: Bool?
    var whitening: Bool?

    enum CodingKeys: String, CodingKey {
        case aha, alcohol, allergen, antioxidant, antiseptic, bha, ceramide, fragrance, gluten, moisturising
        case niacinamide, paraben, peg, pha, retinoid, silicone, softening, soothing, sulfate, vitamin, whitening
        case acneFighting = "acne_fighting"
        case antiAging = "anti_aging"
        case badForDrySkin = "bad_for_dry_skin"
        case badForOilySkin = "bad_for_oily_skin"
        case badForSensitiveSkin = "bad_for_sensitive_skin"
        case fungalAcneFeeding = "fungal_acne_feeding"
        case goodForDrySkin = "good_for_dry_skin"
        case goodForOilySkin = "good_for_oily_skin"
        case goodForSensitiveSkin = "good_for_sensitive_skin"
        case hyaluronicAcid = "hyaluronic_acid"
        case uvProtecting = "uv_protecting"
    }
}

struct Ewg: Decodable {
    var background: String?
    var data: String?
    var decision: String?
    var max: Int8?
    var min: Int8?
    var url: String?
}

struct IntegerProperties: Decodable {
    var comedogenicRating: Int8?
    var natural: Int8?

    enum CodingKeys: String, CodingKey {
        case natural
        case comedogenicRating = "comedogenic_rating"
    }
}

struct PositiveEffect: Decodable {
    var title: String
    var description: String
    var imageUrl: String
    var list: [EffectList]
    var count: Int
    
    enum CodingKeys: String, CodingKey {
        case title, description, list, count
        case imageUrl = "image_url"
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
        case title, description, list, count, slug
        case imageUrl = "image_url"
    }
}

struct EffectList: Decodable {
    var index: Int
    var title: String
    var alias: String
}

struct GoodOrBadForSkinType: Hashable {
    var category: String
    var count: Int8
}
