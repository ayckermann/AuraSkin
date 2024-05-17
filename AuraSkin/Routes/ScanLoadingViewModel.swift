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
    
    @State var ocrOutput: String = "" // untuk parameter get ke api
    
    var body: some View {
        
        if (!ocrOutput.isEmpty){
            AnalysisResultView(ingredients: ocrOutput)
                .onAppear(){
                    print("test")

                }
        }
        else{
            LoadingView()
                .onAppear(perform: {
                    ocr.performOCR(on: image!) { result in
                        switch result {
                        case .success(let text):
                            ocrOutput = text
                            print(ocrOutput)
                        case .failure(let error):
                            print("OCR Error: \(error.localizedDescription)")
                            // Handle error here
                        }
                        
                    }
                    
                    
                })
                .navigationBarBackButtonHidden(true)
        }
        
    }
    
}

//#Preview {
//    ScanLoadingViewModel()
//}
//
