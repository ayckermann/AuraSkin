//
//  TypoCheckView.swift
//  AuraSkin
//
//  Created by sri anggraini on 25/05/24.
//

import SwiftUI

struct TypoCheckView: View {
    var ingredients: String
    
    var body: some View {
        
        VStack {
            Text("Double check the ingredients input")
                .font(.system(size: 17, weight: .regular))
                .foregroundStyle(.gray)
                .padding(.vertical, 20)
       
        

                
            
            Spacer()
                .frame(height: 30)
            
            HStack {
                SectionTextLeading("Ingredients")
                    .foregroundColor(Color.auraSkinPrimaryColor)
            }
            ManualInputTextField(ingredients: ingredients)
            
            
           

        }
        .padding()
    }
    
}

#Preview {
    TypoCheckView(ingredients: "Water, Glycerin, Dicaprylyl Ether, Butylene Glycol, Hydrogenated Ethylhexyl Olivate, Pentylene Glycol, 2-HexanedioL, Hydrogenated Polydecene, saccharide isomerate, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Polymethylsilsesquioxane, Hydrogenated Olive Oil Unsaponifiables, Boron Nitride, Madecassoside, Aloe Barbadensis Leaf Extract, Allantoin, Artemisia Vulgaris Extract, Astrocaryum Murumuru Seed Butter, Glyceryl Acrylate/Acrylic Acid Copolymer, Tromethamine, Ethylhexylglycerin, Xanthan Gum, Dipotassium Glycyrrhizate, Sodium Phytate, Ceramide NP, Sodium Citrate, Citric Acid, Sea Water, Propanediol, Tocopherol, Emiliania Huxleyi Extract, Shea Butter")
}
