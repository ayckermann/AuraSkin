//
//  ScanLoadingViewModel.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI

struct ScanLoadingViewModel: View {
    var image: UIImage?
    
    var body: some View {
        LoadingView()
            .onAppear(perform: {
                OpticalCharRecognition().performOCR(on: image!) { result in
                    switch result {
                    case .success(let recognizedText):
                        print("Recognized Text:")
                        print(recognizedText)
                        // Handle recognized text here
                    case .failure(let error):
                        print("OCR Error: \(error.localizedDescription)")
                        // Handle error here
                    }
                }
            })
    }
    
}

//#Preview {
//    ScanLoadingViewModel()
//}
