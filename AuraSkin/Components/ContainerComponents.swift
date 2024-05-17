//
//  ContainerComponents.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct IngredientTag: View {
    private var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
            .background(Color.auraSkinSecondaryColor)
            .foregroundColor(.white)
            .cornerRadius(25)
    }
}

#Preview {
    IngredientTag("test2")
}

