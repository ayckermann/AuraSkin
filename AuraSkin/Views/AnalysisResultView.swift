//
//  AnalysisResultView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct AnalysisResultView: View {
    var apiServices: APIServices = APIServices()
    @State var apiResponse: IngredientsAnalysisResponse = IngredientsAnalysisResponse()
    var ingredients: String


    @State private var prosConsSegment: IngredientsEffectType = IngredientsEffectType.pros
    @State var data: IngredientsAnalysisResponse?
    @StateObject var model = AnalysisResultViewModel()
    @State var showLoading = false

    @State var prosIngredients: [IngredientsEffect] = []
    @State var consIngredients: [IngredientsEffect] = []

    init(ingredients: String) {
        //        UISegmentedControl.appearance().layer.cornerRadius = 20
        //        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(color(prosConsSegment))
        //        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        //        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .systemBackground.withAlphaComponent(0.10)

        self.ingredients = ingredients
        //        model.getTags(ingredients: ingredients)

    }

    var body: some View {
        VStack {
            if showLoading {
                LoadingView()
            } else {
                ScrollView {
                    VStack {
                        HStack {
                            SectionTextLeading("Ingredients")
                                .foregroundColor(Color.auraSkinPrimaryColor)
                        }

                        ScrollView {
                            VStack(alignment: .leading, spacing: 4) {
                                ForEach(model.tagRows, id:\.self){ rows in
                                    HStack(spacing: 6){
                                        ForEach(rows){ tag in
                                            IngredientTag(tag.name)
                                        }
                                    }
                                    .frame(height: 28)
                                    .padding(.bottom, 10)

                                }
                            }.padding()
                        }
                        .frame(height: 215)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1)
                        )
                        .padding(.bottom)

                        Picker("ProsConsSegment", selection: $prosConsSegment) {
                            Text("Pros")
                                .tag(IngredientsEffectType.pros)
                            Text("Cons")
                                .tag(IngredientsEffectType.cons)
                        }
                        .colorMultiply(color(prosConsSegment))
                        .cornerRadius(20)
                        .pickerStyle(.segmented)

                        switch prosConsSegment {
                            case .cons:
                                IngredientEffectList(.cons, consIngredients)
                            default:
                                IngredientEffectList(.pros, prosIngredients)
                        }

                    }
                    .padding(.horizontal)
                }
            }

        }
        .onAppear {
            Task { @MainActor in
                self.showLoading = true
                
                do {
                    self.apiResponse = try await apiServices.getIngredientAnalysis(ingredients)
                } catch {
                    print(error.localizedDescription)
                }

                self.prosIngredients = model.getProsIngredients(data: apiResponse)
                self.consIngredients = model.getConsIngredients(data: apiResponse)

                model.getTags(ingredients: ingredients)
                self.showLoading = false
            }
        }


    }

    func color(_ selected: IngredientsEffectType) -> Color {
        switch selected {
            case .pros:
                return Color.auraSkinPrimaryColor
            case .cons:
                return Color.auraSkinConsColor
        }
    }
}

#Preview {
    AnalysisResultView(ingredients: ingredientsDummy)
}
