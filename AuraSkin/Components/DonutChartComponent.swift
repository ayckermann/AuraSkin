//
//  DonutChartComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 20/05/24.
//

import SwiftUI
import Charts

struct DonutChartComponent: View {
    var ingredients: [GoodOrBadForSkinType] = [
        .init(category: "good", count: 0),
        .init(category: "bad", count: 0)
    ]
    
    var skinType: SkinType
    var goodForSkinType: Int8
    var badForSkinType: Int8
    var skinTypeString: String

    init(ingredients: [GoodOrBadForSkinType], skinType: SkinType) {
        self.ingredients = ingredients
        self.skinType = skinType
        self.goodForSkinType = ingredients[0].count
        self.badForSkinType = ingredients[1].count

        switch skinType {
            case .dry:
                self.skinTypeString = "Dry"
            case .normal:
                self.skinTypeString = "Normal"
            case .oily:
                self.skinTypeString = "Oily"
            case .combination:
                self.skinTypeString = "Combination"
            case .sensitive:
                self.skinTypeString = "Sensitive"
            case .combinationDry:
                self.skinTypeString = "Dry"
            case .combinationOily:
                self.skinTypeString = "Oily"
        }
    }

    var body: some View {
        ZStack {
            Chart(ingredients, id: \.self) { ingredients in
                SectorMark(
                    angle: .value("count", ingredients.count),
                    innerRadius: .ratio(0.55),
                    outerRadius: .inset(10),
                    angularInset: 3
                )
                .cornerRadius(4)
                .foregroundStyle(by: .value("category", ingredients.category))
            }
            .chartForegroundStyleScale(
                [
                    "good": Color.auraSkinSecondaryColor,
                    "bad": Color.auraSkinPrimaryColor,
                ]
            )
            .chartLegend(position: .bottom, alignment: .center)

            VStack {
                if badForSkinType == 0 {
                    Text("\(goodForSkinType)")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                    Text("Good for \(skinTypeString)")
                        .font(skinType == .combinationDry || skinType == .combinationOily ? .caption2 : .subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                } else if goodForSkinType == 0 {
                    Text("\(badForSkinType)")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                    Text("Bad for \(skinTypeString)")
                        .font(skinType == .combinationDry || skinType == .combinationOily ? .caption2 : .subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                } else {
                    Text("\(goodForSkinType) / \(badForSkinType+goodForSkinType)")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)

                    Text("Good for \(skinTypeString)")
                        .font(skinType == .combinationDry || skinType == .combinationOily ? .caption2 : .subheadline)
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    @State var ingredients: [GoodOrBadForSkinType] = [
        AuraSkin.GoodOrBadForSkinType(category: "good", count: 13),
        AuraSkin.GoodOrBadForSkinType(category: "bad", count: 2)]
    return DonutChartComponent(ingredients: ingredients, skinType: .combination)
}
