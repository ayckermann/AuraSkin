//
//  ScanLoadingViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI

struct ScanLoadingViewModel: View {
    var image: UIImage?
    var ocr = OpticalCharRecognition()
    
    @State var combinedText: String = "" // untuk parameter get ke api
    @State var separatedText: [String] = [] // untuk textfield result ingredient (tag ingredient)

    
    var body: some View {
        
        
        if (!combinedText.isEmpty){
            AnalysisResultView(ingredients: combinedText)
        }
        
        else{
            LoadingView()
                .onAppear(perform: {
                    ocr.performOCR(on: image!) { result in
                        switch result {
                        case .success(let text):
                            combinedText = text
                            print(combinedText)
                        case .failure(let error):
                            print("OCR Error: \(error.localizedDescription)")
                            // Handle error here
                        }
                    }
                    
                    self.separatedText = ocr.separatedText
                    
                })
        }
        
    }
    
}

//#Preview {
//    ScanLoadingViewModel()
//}

