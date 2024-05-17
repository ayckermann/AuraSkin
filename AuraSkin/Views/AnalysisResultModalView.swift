//
//  AnalysisResultModalView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 12/05/24.
//

import SwiftUI

struct AnalysisResultModalView: View {
    @Binding var isShowingSheet: Bool
    @Binding var data: IngredientsEffect
    
    var body: some View {
        
        VStack {
            ZStack {
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Label("Results", systemImage: "chevron.left")
                        .foregroundColor(Color.auraSkinPrimaryColor)
                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Text(data.effect)
                    .font(.title2)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        
        
        
    }
        
    }
        
        
    func didDismiss() {
        // Handle the dismissing action.
    }


//#Preview {
//    AnalysisResultModalView(isShowingSheet: $isShowingSheet, data: $data)
//}
