//
//  AnalysisResultController.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import Foundation
import SwiftUI

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.width
}

extension String {
    func getSize() -> CGFloat{
        let font = UIFont.systemFont(ofSize: 16)
        let attributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: attributes)
        return size.width
    }
}

class AnalysisResultViewModel: ObservableObject {
    @Published var tagRows: [[Tag]] = []
    var tags: [Tag] = []
    
    init(){
        getTags()
    }
    
    func getTags(){
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth = UIScreen.screenWidth - 10
        let tagSpaceing: CGFloat = 14 /*Leading Padding*/ + 30 /*Trailing Padding*/ + 6 + 6 /*Leading & Trailing 6, 6 Spacing*/
        
        for ingredient in ingredients.split(separator: ", ") {
            tags.append(Tag(name: String(ingredient)))
        }
        
        if !tags.isEmpty{
            
            for index in 0..<tags.count{
                self.tags[index].size = tags[index].name.getSize()
            }
            
            tags.forEach{ tag in
                
                totalWidth += (tag.size + tagSpaceing)
                
                if totalWidth > screenWidth{
                    totalWidth = (tag.size + tagSpaceing)
                    rows.append(currentRow)
                    currentRow.removeAll()
                    currentRow.append(tag)
                }else{
                    currentRow.append(tag)
                }
            }
            
            if !currentRow.isEmpty{
                rows.append(currentRow)
                currentRow.removeAll()
            }
            
            self.tagRows = rows
        } else {
            self.tagRows = []
        }
        
    }
}
