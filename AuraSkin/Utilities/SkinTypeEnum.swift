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
            return "Combination"
        case .combinationOily:
            return "Combination"
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
        SkinTypeInfo(skinType:  .oily,imageSkin: "oily",  description: "Kulit berminyak memiliki pori-pori besar dan biasanya berkilau.", characteristics: "Tampilan wajah yang terlihat mengkilap, Sering berjerawat, Berkomedo dan memiliki pori-pori wajah yang tergolong besar, Berminyak di seluruh wajah, Makeup yang tidak tahan lama, Kulit berjerawat (terutama black head dan white head)"),
        SkinTypeInfo(skinType: .dry,imageSkin: "dry", description: "Kulit kering adalah kondisi kulit yang ditandai dengan rasa gatal, bersisik dan pecah-pecah.", characteristics: "Kulit terasa ketat, bersisik,kadang-kadang pecah-pecah, Tipe kering dapat tampak mengelupas, Pori-pori tidak terlihat, Terasa kering setelah membersihkan wajah, Kerut dan garis halus lebih terlihat, Jika menggunakan makeup cenderung mudah cracking"),
        SkinTypeInfo(skinType: .combination,imageSkin: "combination", description: "Kulit kombinasi memiliki area yang berminyak dan area yang kering.", characteristics: "Zona T berminyak (dahi, hidung, dagu) dan pipi kering, Area pipi memiliki kulit yang kering, Mudah bereaksi terhadap faktor tertentu"),
        SkinTypeInfo(skinType: .sensitive,imageSkin: "sensitive", description: "Kulit sensitif mudah bereaksi terhadap berbagai faktor.", characteristics: "Kulit sensitif cenderung menjadi kemerahan dan terasa gatal,  Seringkali terasa terbakar, Rentan mengalami alergi atau iritasi, Sering kali reaktif terhadap produk perawatan kulit"),
        SkinTypeInfo(skinType: .normal,imageSkin: "normal", description: "Kulit normal memiliki keseimbangan yang baik antara kelembapan dan minyak.", characteristics: "Tidak terlalu kering atau berminyak, Memiliki pori-pori dengan ukuran kecil dan tidak terlalu terlihat, Jarang berjerawat, Tekstur kulit wajah yang halus dan lembut, Bertekstur elastis dan kenyal, Kandungan minyak di area T dan area lain di wajah seimbang, ")
    ]
}
