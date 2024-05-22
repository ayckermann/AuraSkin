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
                    Label("Journey", systemImage: selection == 1 ? "book.fill" : "book")
                        .environment(\.symbolVariants, .none)
                    
                    
                }
                .tag(1)
            ScanViewRoute()
                .tabItem {
                    
                    Label("Scan", systemImage: selection == 2 ? "camera.fill" : "camera")
                        .environment(\.symbolVariants, .none)
                    
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: selection == 3 ? "person.fill" : "person")
                        .environment(\.symbolVariants, .none)
                    
                }
                .tag(3)
        }
        .clipShape(UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 10, topTrailing: 10)))
    }
}


#Preview {
    ViewController()
}
