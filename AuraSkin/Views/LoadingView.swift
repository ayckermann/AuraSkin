//
//  LoadingView.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 11/05/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView()
                .frame(width: 400)
                .padding()
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
