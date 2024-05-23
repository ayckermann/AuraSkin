//
//  SkinTypeEnum.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 21/05/24.
//

import Foundation

enum SkinType: String, CaseIterable, CustomStringConvertible {
    
    case normal, oily, dry, combination, sensitive, none
    
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
        }
    }
}
