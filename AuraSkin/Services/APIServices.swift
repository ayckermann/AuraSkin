//
//  APIServices.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation

extension AnalysisResultView {
//    func apiCall() {
//        guard let url = URL(string: "https://api.cosmily.com/api/v1/analyze/ingredient_list") else { return }
//        
//        // headers
//        let headers = [
//            "Content-Type": "application/json"
//        ]
//        
//        // body
//        let body = try? JSONSerialization.data(
//            withJSONObject: ["ingredients": ingredients],
//            options: []
//        )
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = body
//        
//        for (key, value) in headers {
//            request.setValue(value, forHTTPHeaderField: key)
//        }
//        
//    //        send request
//        URLSession.shared.dataTask(with: request) { data, response, error in
//    //            handling error
//            
//            if error != nil {
//                print(error?.localizedDescription)
//                return
//            }
//            
//            guard let data = data else { return }
//    //        print(String(data: data, encoding: .utf8))
//            
//            
//    //            decode the json data
//            do {
//                let apiData = try JSONDecoder().decode(IngredientsAnalysisResponse.self, from: data)
//                
//                self.data = apiData
//            } catch {
//                print(error.localizedDescription)
//            }
//            
//    //        return apiResponse
//            
//            
//        }
//        .resume()
//    }
}

class APIServices {
    func getIngredientAnalysis() async throws -> IngredientsAnalysisResponse {
        var apiResponse: IngredientsAnalysisResponse = IngredientsAnalysisResponse()
        guard let url = URL(string: "https://api.cosmily.com/api/v1/analyze/ingredient_list") else { return apiResponse }

        // headers
        let headers = [
            "Content-Type": "application/json"
        ]

        // body
        let body = try? JSONSerialization.data(
            withJSONObject: ["ingredients": ingredientsDummy],
            options: []
        )

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body

        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }

        // send request
        URLSession.shared.dataTask(with: request) { data, response, error in
        // handling error

            if error != nil {
                print(error?.localizedDescription)
                return
            }

            guard let data = data else { return }
            // print(String(data: data, encoding: .utf8))


        // decode the json data
            do {
                apiResponse = try JSONDecoder().decode(IngredientsAnalysisResponse.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }
        return apiResponse
    }
}
