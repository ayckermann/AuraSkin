//
//  APIServices.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Foundation

class APIServices {
    func getIngredientAnalysis(_ ingredients: String) async throws -> IngredientsAnalysisResponse {
        var apiResponse: IngredientsAnalysisResponse = IngredientsAnalysisResponse()
        guard let url = URL(string: "https://api.cosmily.com/api/v1/analyze/ingredient_list") else { return apiResponse }

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

        // send request
        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                print("Invalid response or status code")
                return apiResponse
            }

            // decode the json data
            do {
                apiResponse = try JSONDecoder().decode(IngredientsAnalysisResponse.self, from: data)
            } catch {
                print(error.localizedDescription)
                print("ERROR DETAIL: ", error)
            }
        } catch {
            print("Request failed with error: \(error.localizedDescription)")
        }

        return apiResponse
    }
}
