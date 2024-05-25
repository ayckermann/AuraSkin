//
//  AnalysisResultView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct AnalysisResultView: View {
    @State private var networkMonitor: NetworkMonitor = NetworkMonitor()
    @State var showLoading = false
    @State var showSaveProduct = false
    @State var isHitApi: Bool = false

    private var ingredients: String

    init(ingredients: String) {
        self.ingredients = ingredients
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if !networkMonitor.isConnected {
                    NetworkUnavailableView()
                } else {
                    if showLoading && !isHitApi {
                        LoadingView()
                    } else {
                        AnalysisResultComponent(ingredients: ingredients)
                            .padding()
                    }
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
                SaveProductView(ingredients: ingredients)
                    .padding(.top, 5)
            }
        }
    }
}

#Preview {
    AnalysisResultView(ingredients: ingredientsDummy)
}
