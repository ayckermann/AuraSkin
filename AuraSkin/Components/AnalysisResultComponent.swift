//
//  AnalysisResultComponent.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 24/05/24.
//

import SwiftUI

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

struct AnalysisResultComponent: View {
    @AppStorage("skinTypePersistance") var skinType: SkinType = .dry

    @State private var networkMonitor: NetworkMonitor = NetworkMonitor()
    @State var apiResponse: IngredientsAnalysisResponse = IngredientsAnalysisResponse()
    @State var prosConsSegment: IngredientsEffectType = IngredientsEffectType.pros
    @State var data: IngredientsAnalysisResponse?
    @State var prosIngredients: [IngredientsEffect] = []
    @State var consIngredients: [IngredientsEffect] = []
    @State var showLoading = false
    @State var showSaveProduct = false
    @State var skinRelatedIngredients: [GoodOrBadForSkinType] = [
        .init(category: "good", count: 0),
        .init(category: "bad", count: 0)
    ]
    @State var skinRelatedIngredientsCombOily: [GoodOrBadForSkinType] = [
        .init(category: "good", count: 0),
        .init(category: "bad", count: 0)
    ]
    @State var skinRelatedIngredientsCombDry: [GoodOrBadForSkinType] = [
        .init(category: "good", count: 0),
        .init(category: "bad", count: 0)
    ]
    @State var isHitApi: Bool = false

    var model = AnalysisResultViewModel()
    var apiServices: APIServices = APIServices()
    var ingredients: String


    init(ingredients: String) {
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .systemBackground.withAlphaComponent(0.10)

        self.ingredients = ingredients
    }

    var body: some View {
        VStack {
            if !networkMonitor.isConnected {
                NetworkUnavailableView()
            } else {
                if showLoading && !isHitApi {
                    LoadingView()
                } else {
                    ScrollView {
                        LazyVStack {
                            HStack {
                                Text("Skin Type Related Ingredients")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.auraSkinPrimaryColor)
                                    .opacity(0.5)
                            }

                            switch skinType {
                                case .combination:
                                    HStack {
                                        DonutChartComponent(ingredients: skinRelatedIngredientsCombDry, skinType: .combinationDry)
                                            .aspectRatio(1, contentMode: .fit)
                                            .padding(.bottom)

                                        DonutChartComponent(ingredients: skinRelatedIngredientsCombOily, skinType: .combinationOily)
                                            .aspectRatio(1, contentMode: .fit)
                                            .padding(.bottom)
                                    }
                                default:
                                    DonutChartComponent(ingredients: skinRelatedIngredients, skinType: skinType)
                                        .aspectRatio(1.5, contentMode: .fit)
                                        .padding(.bottom)
                            }

                            Text("Other Non-Skin Type Related Ingredients")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.gray)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)

                            Picker("ProsConsSegment", selection: $prosConsSegment) {
                                Text("Positive Effect \(getTotalIngredients(prosIngredients))")
                                    .tag(IngredientsEffectType.pros)
                                Text("Hazard \(getTotalIngredients(consIngredients))")
                                    .tag(IngredientsEffectType.cons)
                            }
                            .frame(height: 40)
                            .colorMultiply(color(prosConsSegment))
                            .cornerRadius(14)
                            .pickerStyle(.segmented)

                            switch prosConsSegment {
                                case .cons:
                                    IngredientEffectList(.cons, consIngredients)
                                        .padding(.horizontal)
                                default:
                                    IngredientEffectList(.pros, prosIngredients)
                                        .padding(.horizontal)
                            }
                        }
                    }
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

                if skinType == .combination {
                    self.skinRelatedIngredientsCombOily = model.getSkinRelatedIngredients(item: apiResponse, type: .oily)
                    self.skinRelatedIngredientsCombDry = model.getSkinRelatedIngredients(item: apiResponse, type: .dry)
                } else {
                    self.skinRelatedIngredients = model.getSkinRelatedIngredients(item: apiResponse, type: skinType)
                }

                self.prosIngredients = model.getProsIngredients(data: apiResponse)
                self.consIngredients = model.getConsIngredients(data: apiResponse)

                self.isHitApi = true
                self.showLoading = false
            }
        }
    }

    private func color(_ selected: IngredientsEffectType) -> Color {
        switch selected {
            case .pros:
                return Color.auraSkinPrimaryColor
            case .cons:
                return Color.auraSkinConsColor
        }
    }

    private func getTotalIngredients(_ ingredients: [IngredientsEffect]) -> Int {
        var total: Int = 0

        for ingredient in ingredients {
            total += ingredient.count
        }

        return total
    }
}

#Preview {
    AnalysisResultComponent(ingredients: ingredientsDummy)
}
