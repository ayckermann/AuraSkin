//
//  TagView.swift
//  AuraSkin
//
//  Created by Risma Harby on 20/05/24.
//

import SwiftUI

struct TagView: View {
    let tag: Tag
    let onDelete: () -> Void

    var body: some View {
        HStack {
            Text(tag.name)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(5)
            Button(action: onDelete) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.white)
            }
        }
        .padding(4)
        .background(Color.blue)
        .cornerRadius(5)
    }
    
}

//#Preview {
//    TagView()
//}
