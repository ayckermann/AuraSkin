//
//  ScanLoadingViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI

struct ScanLoadingViewModel: View {
    var image: UIImage?
    @State var resultWord: [String] = []
    
    var body: some View {
        
        
        if (!resultWord.isEmpty){
            ScrollView{
                VStack {
                    ForEach(resultWord, id: \.self){ result in
                        Text(result)
                    }
                }
            }
            .padding(35)
        }
        
        else{
            LoadingView()
                .onAppear(perform: {
                    OpticalCharRecognition().performOCR(on: image!) { result in
                        switch result {
                        case .success(let words):
                            resultWord = words
                        case .failure(let error):
                            print("OCR Error: \(error.localizedDescription)")
                            // Handle error here
                        }
                    }
                })
        }
        
    }
    
}

//#Preview {
//    ScanLoadingViewModel()
//}

