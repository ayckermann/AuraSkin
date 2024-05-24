//
//  ViewController.swift
//  AuraSkin
//
//  Created by Ayatullah Ma'arif on 06/05/24.
//

import SwiftUI

struct ViewController : View {
    @State private var selection = 2
    
    // user-default untuk user ski type; kalo udah ada page buat milih ini diganti ke .none
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .none
    
    @State var skinType: SkinType = .none
    
    var body: some View {
        
        if skinTypePersistance == .none {
            tempChooseSkinType()
        }  else{
            TabView(selection : $selection){
                ProductsView()
                    .tabItem {
                        Label("Products", systemImage: selection == 1 ? "bookmark.fill" : "bookmark")
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
            
            .tint(.greenAccent)
        }
        
    }
}


struct tempChooseSkinType: View{
    @State var selection: SkinType = .none
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .none
    
    
    var body: some View{
        Picker("Select", selection: $selection) {
            ForEach(SkinType.allCases.filter{return $0 != .none}, id:\.self) { option in
                Text(String(describing: option))
            }
        }
        .pickerStyle(.menu)
        
        Button(action: {
            skinTypePersistance = selection
        }, label: {
            TestButton(text: "done")
        })
        
    }
}



#Preview {
    ViewController()
}
