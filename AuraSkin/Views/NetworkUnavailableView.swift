//
//  NetworkUnavailableView.swift
//  AuraSkin
//
//  Created by M. Ilham Syaputra on 23/05/24.
//

import SwiftUI

struct NetworkUnavailableView: View {
    var body: some View {
        ContentUnavailableView(
            "No Internet Connection",
            systemImage: "wifi.exclamationmark",
            description: Text("Please check your internet connection and try again.")
        )
    }
}

#Preview {
    NetworkUnavailableView()
}
