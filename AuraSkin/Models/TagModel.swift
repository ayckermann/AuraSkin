//
//  TagModel.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 12/05/24.
//

import Foundation

struct Tag: Identifiable, Hashable{
    var id = UUID().uuidString
    var name: String
    var size: CGFloat = 0
}
