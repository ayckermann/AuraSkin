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


struct SkinTypeInfoData{
    
    static let skinTypesData :[SkinTypeInfo] = [
        SkinTypeInfo(skinType:  .oily,imageSkin: "Group 376",  description: "Kulit berminyak memiliki pori-pori besar dan biasanya berkilau.", characteristics: "Sering berjerawat, pori-pori besar, dan berminyak di seluruh wajah."),
        SkinTypeInfo(skinType: .dry,imageSkin: "dry1", description: "Kulit kering adalah kondisi kulit yang ditandai dengan rasa gatal, bersisik dan pecah-pecah.", characteristics: "Kulit terasa ketat, bersisik,kadang-kadang pecah-pecah, Pori-pori tidak terlihat, Terasa kering setelah membersihkan wajah, Kerut dan garis halus lebih terlihat."),
        SkinTypeInfo(skinType: .combination,imageSkin: "combination", description: "Kulit kombinasi memiliki area yang berminyak dan area yang kering.", characteristics: "Zona T berminyak (dahi, hidung, dagu) dan pipi kering."),
        SkinTypeInfo(skinType: .sensitive,imageSkin: "sensitive", description: "Kulit sensitif mudah bereaksi terhadap berbagai faktor.", characteristics: "Mudah kemerahan, gatal, dan seringkali terasa terbakar."),
        SkinTypeInfo(skinType: .normal,imageSkin: "normal", description: "Kulit normal memiliki keseimbangan yang baik antara kelembapan dan minyak.", characteristics: "Tidak terlalu kering atau berminyak, pori-pori kecil, dan jarang berjerawat.")
    ]
}
