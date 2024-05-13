//
//  OpticalCharRecognition.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import Vision
import SwiftUI

struct OpticalCharRecognition{
    func performOCR(on image: UIImage, completion: @escaping (Result<[String], Error>) -> Void) {
        guard let cgImage = image.cgImage else {
            completion(.failure(OCRProcessingError.invalidImage))
            return
        }
        
        let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                completion(.failure(OCRProcessingError.noTextRecognized))
                return
            }
            
            var combinedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { continue }
                combinedText += topCandidate.string + " " // Append recognized text with space
            }
                        
            // Replace all newline characters ("\n") with spaces
            combinedText = combinedText.replacingOccurrences(of: "\n", with: " ")
                        
            // Split combined text into an array of words
            var words = combinedText.components(separatedBy: ",")
                                            .map { $0.trimmingCharacters(in: .whitespaces) } // Trim whitespace
                               
            // Filter out empty strings and remove "ingredients:"
            words = words.filter { !$0.isEmpty && !$0.lowercased().contains("ingredients:") }
            
            completion(.success(words))
            
        }
        
        do {
            try requestHandler.perform([request])
        } catch {
            completion(.failure(error))
        }
    }
    
    enum OCRProcessingError: Error {
        case invalidImage
        case noTextRecognized
    }
    
}