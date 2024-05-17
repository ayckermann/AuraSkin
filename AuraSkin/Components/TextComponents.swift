//
//  TextComponents.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 11/05/24.
//

import SwiftUI

struct SectionTextLeading: View {
    var sectionTitle: String
    
    init(_ sectionTitle: String) {
        self.sectionTitle = sectionTitle
    }
    
    var body: some View {
        Text(sectionTitle)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}

struct SectionTextTrailing: View {
    var sectionTitle: String
    
    init(_ sectionTitle: String) {
        self.sectionTitle = sectionTitle
    }
    
    var body: some View {
        Text(sectionTitle)
            .font(.title2)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
    }
}


#Preview {
    SectionTextTrailing("Section Title")
}
