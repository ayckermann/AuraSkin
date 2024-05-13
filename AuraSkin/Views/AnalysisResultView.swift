//
//  AnalysisResultView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct AnalysisResultView: View {
    @State private var prosConsSegment: IngredientsEffectType = IngredientsEffectType.pros
    @State var data: IngredientsAnalysisResponse?
    @StateObject var model = AnalysisResultViewModel()
    
    init() {
//        UISegmentedControl.appearance().layer.cornerRadius = 20
//        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(color(prosConsSegment))
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
//        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.font: UIFont.boldSystemFont(ofSize: 18)], for: .normal)
        UISegmentedControl.appearance().backgroundColor = .systemBackground.withAlphaComponent(0.10)
    }
    
    var body: some View {
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
                
//                if let ss = data?.analysis?.totalIngredients {
//                    Text("\(ss)")
//                }
                
                switch prosConsSegment {
                case .cons:
                    IngredientEffectList(.cons, consIngredients)
                default:
                    IngredientEffectList(.pros, prosIngredients)
                }
                
            }
            .padding(.horizontal)
        }
        .task {
            do {
                
            }
        }
//        .onAppear{
//            apiCall()
//        }
            
        
    }
    
    func apiCall() {
        guard let url = URL(string: "https://api.cosmily.com/api/v1/analyze/ingredient_list") else { return }
        
        // headers
        let headers = [
            "Content-Type": "application/json"
        ]
        
        // body
        let body = try? JSONSerialization.data(
            withJSONObject: ["ingredients": ingredients],
            options: []
        )
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
    //        send request
        URLSession.shared.dataTask(with: request) { data, response, error in
    //            handling error
            
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let data = data else { return }
    //        print(String(data: data, encoding: .utf8))
            
            
    //            decode the json data
            do {
                let apiData = try JSONDecoder().decode(IngredientsAnalysisResponse.self, from: data)
                
                self.data = apiData
                
                
                print(self.data?.analysis?.totalIngredients)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
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
    AnalysisResultView()
}
