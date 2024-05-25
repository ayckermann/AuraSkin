//
//  ScanLoadingViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI

struct TypoCheckRoute: View {
    var image: UIImage?
    var ocr = OpticalCharRecognition()
    
    @State var ocrOutput: String = ""
    
    var body: some View {
        ZStack{
            SwiftUIView(text: ocrOutput)
                .toolbar(.hidden, for: .tabBar)
            
            VStack{
                Spacer()
                
                NavigationLink {
                    AnalysisResultView(ingredients: ocrOutput)
                        .toolbar(.visible, for: .tabBar)
                } label: {
                    TestButton(text: "ANALYZE")
                }

            }
            
        }
        .task {
            ocr.performOCR(on: image!) { result in
                switch result {
                case .success(let text):
                    ocrOutput = text
                case .failure(let error):
                    print("OCR Error: \(error.localizedDescription)")
                    // Handle error here
                }
                
            }
        }
        
    }
    
}

//#Preview {
//    ScanLoadingViewModel()
//}
//
