//
//  SkinTypeEnum.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 21/05/24.
//

import Foundation


enum SkinType: String, CaseIterable, CustomStringConvertible {
    
    case normal, oily, dry, combination, sensitive, none, combinationDry, combinationOily
    
    var description: String {
        
        switch self {
            
        case .normal:
            return "Normal"
        case .oily:
            return "Oily"
        case .dry:
            return "Dry"
        case .combination:
            return "Combination"
        case .sensitive:
            return "Sensitive"
        case .none:
            return ""
        case .combinationDry:
            return "Sensitive"
        case .combinationOily:
            return "Sensitive"
        }
    }
    
}

// combinationDry & combinationOily dibuat hanya untuk kepentingan generate chart. bukan sebagai skintype riil ya cuyyyyy

struct SkinSelectionData {
    static let selections: [SelectionSkin] = [
        SelectionSkin(imageName: "drop.circle", skinType: .oily, declaration: "Has large pores and an overall shine", info: "info.circle"),
        SelectionSkin(imageName: "wind.circle.fill", skinType: .dry, declaration: "Feels tight, might be flaky", info: "info.circle"),
        SelectionSkin(imageName: "circle.lefthalf.striped.horizontal", skinType: .combination, declaration: "Has large pores", info: "info.circle"),
        SelectionSkin(imageName: "circle.dotted.circle", skinType: .sensitive,  declaration: "Has large pores", info: "info.circle"),
        SelectionSkin(imageName: "swirl.circle.righthalf.filled",skinType: .normal,  declaration: "Has large pores", info: "info.circle"),
        
    ]
}
