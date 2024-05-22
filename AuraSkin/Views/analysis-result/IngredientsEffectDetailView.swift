//
//  AnalysisResultModalView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 12/05/24.
//

import SwiftUI

struct IngredientsEffectDetailView: View {
    var data: IngredientsEffect

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(data.ingredientsTable, id: \.title) { data in
                        Text(data.title)
                            .font(.body)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        Text(data.introtext == "" ? "-" : removeHtmlTag(text: data.introtext))
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .padding(.bottom)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .navigationTitle(data.effect)
        .accentColor(.red)
    }

    private func removeHtmlTag(text: String) -> String {
        let htmlTag: [String] = ["<p>", "</p>", "<strong>", "</strong>"]
        var cleanedString: String = text

        for tag in htmlTag {
            cleanedString = cleanedString.replacingOccurrences(of: tag, with: "")
        }

        return cleanedString
    }
}


#Preview {
    var data: IngredientsEffect = prosIngredientsDummy[0]
    return IngredientsEffectDetailView(data: data)
}
