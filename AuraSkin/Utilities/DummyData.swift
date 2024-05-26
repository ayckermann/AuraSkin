//
//  DummyData.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

var prosIngredientsDummy: [IngredientsEffect] = [
    IngredientsEffect(effect: "Mouisturising", description: "Hydrates the skin", count: 9, symbol: "moisturising", ingredients: [
        ingredientsTable(title: "Glycerin", introtext: "<p><strong>One of the best-known humectants.</strong> It helps to hydrate skin <strong>very fast</strong>, but the effect <strong>doesn\'t last too long</strong>. That\'s why some people may feel dryness after 3 - 4 hours and have to re-apply skincare products once again. Works even in low concentrations but becomes very effective at <strong>10 - 40%</strong> concentration. It\'s used in cosmetics for more than 50 years and it is researched very well. <strong>A great component to counter dryness!</strong></p>"),
        ingredientsTable(title: "Pentylene Glycol", introtext: ""),
        ingredientsTable(title: "saccharide isomerate", introtext: ""),
        ingredientsTable(title: "Aloe Barbadensis Leaf Extract", introtext: ""),
        ingredientsTable(title: "Allantoin", introtext: ""),
        ingredientsTable(title: "Ethylhexylglycerin", introtext: "<p>This component is a <strong>preservative</strong> that is very often used in a combination with phenoxyethanol to boost the effectiveness. Ethylhexylglycerin also temporarily improves skin condition, making it softer.</p>"),
        ingredientsTable(title: "Xanthan Gum", introtext: ""),
        ingredientsTable(title: "Propanediol", introtext: ""),
        ingredientsTable(title: "Shea Butter", introtext: "")
    ]),
    IngredientsEffect(effect: "Softening", description: "Improve texture", count: 4, symbol: "softening"),
    IngredientsEffect(effect: "Acne fighting", description: "Treats and prevents acne", count: 7, symbol: "acneFighting"),
    IngredientsEffect(effect: "Anti aging", description: "Prevents aging", count: 3, symbol: "antiAging")
]

var consIngredientsDummy: [IngredientsEffect] = [
    IngredientsEffect(effect: "Comedogenic", description: "Subject to clog pores", count: 4),
    IngredientsEffect(effect: "Parabens", description: "Potentially toxic", count: 4),
]

var ingredientsDummy: String = "Water, Glycerin, Dicaprylyl Ether, Butylene Glycol, Hydrogenated Ethylhexyl Olivate, Pentylene Glycol, 2-HexanedioL, Hydrogenated Polydecene, saccharide isomerate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Polymethylsilsesquioxane, Hydrogenated Olive Oil Unsaponifiables, Boron Nitride, Madecassoside, Aloe Barbadensis Leaf Extract, Allantoin, Artemisia Vulgaris Extract, Astrocaryum Murumuru Seed Butter, Glyceryl Acrylate/Acrylic Acid Copolymer, Tromethamine, Ethylhexylglycerin, Xanthan Gum, Dipotassium Glycyrrhizate, Sodium Phytate, Ceramide NP, Sodium Citrate, Citric Acid, Sea Water, Propanediol, Tocopherol, Emiliania Huxleyi Extract, Shea Butter"
