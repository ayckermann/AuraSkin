//
//  ViewController.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI

struct ViewController : View {
    @State private var selection = 2

    var body: some View {
        TabView(selection : $selection){
            JourneyView()
                .tabItem {
                    Label("Journey", systemImage: "book")
                                            .foregroundStyle(.white)

                }
                .tag(1)
            ScanView()
                .tabItem {
                    Label("Scan", systemImage: "camera")
//                        .foregroundStyle(.white)
                }
                .tag(2)
                .background(Color(.black))
//                .foregroundStyle(.white)
//

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
        }
    }
}


#Preview {
    ViewController()
}
