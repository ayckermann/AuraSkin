//
//  AnalysisResultView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

extension UISegmentedControl {
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
}

struct AnalysisResultView: View {
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
    @State var isHitApi: Bool = false

    var model = AnalysisResultViewModel()
    var apiServices: APIServices = APIServices()
    var ingredients: String
    @State var skinType: SkinType = .normal
    
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .normal

    init(ingredients: String) {
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 14)], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .systemBackground.withAlphaComponent(0.10)

        self.ingredients = ingredients
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if showLoading && !isHitApi {
                    LoadingView()
                } else {
                    ScrollView {
                        VStack {
                            HStack {
                                Text("Skin Type Related Ingredients")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.auraSkinPrimaryColor)
                                    .opacity(0.5)
                            }

                            DonutChartComponent(ingredients: skinRelatedIngredients, skinType: skinType)
                                .aspectRatio(1.5, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .padding(.bottom)

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
                        .padding(.horizontal)
                    }
                }
                
            }
            .onAppear{
                skinType = skinTypePersistance
            }
            .onAppear {
                Task { @MainActor in
                    self.showLoading = true
                    
                    do {
                        self.apiResponse = try await apiServices.getIngredientAnalysis(ingredients)
                    } catch {
                        print(error.localizedDescription)
                    }

                    self.skinRelatedIngredients = model.getSkinRelatedIngredients(item: apiResponse, type: skinType)
                    self.prosIngredients = model.getProsIngredients(data: apiResponse)
                    self.consIngredients = model.getConsIngredients(data: apiResponse)

                    self.isHitApi = true
                    self.showLoading = false
                }
            }
        }
        .navigationTitle("Analysis Result")
        .toolbar {
            Button {
                showSaveProduct.toggle()
            } label: {
                Image(systemName: "bookmark")
            }
        }
        .sheet(isPresented: $showSaveProduct) {
            NavigationStack {
                SaveProductView()
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
    AnalysisResultView(ingredients: ingredientsDummy)
}
