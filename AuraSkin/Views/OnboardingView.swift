import SwiftUI

struct OnboardingView: View {
    @AppStorage("skinTypePersistance") var skinTypePersistance: SkinType = .none
    
    @State var skinType: SkinType = .none
    
    @State var isPicked = false
    
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 50) {
                VStack {
                    Text("Welcome!")
                        .font(.system(size: 32, weight: .medium, design: .default))
                        .foregroundColor(.black)
                        .padding(.leading, 1.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Let us know about you. Choose your skin type!")
                        .foregroundColor(.gray)
                        .padding(0.0)
                        .frame(maxWidth: 370, alignment: .leading)
                }
                .padding(.leading)
                
                VStack(spacing: 16) {
                    ForEach(SkinSelectionData.selections) { selection in
                        
                        if(skinType == selection.skinType){
                            SelectSkinView(selection: selection, isSelected: true)
                                .onTapGesture {
                                    skinType = selection.skinType
                                }
                        }
                        else{
                            SelectSkinView(selection: selection, isSelected: false)
                                .onTapGesture {
                                    skinType = selection.skinType
                                }
                        }
                        
//                        SelectSkinView(selection: selection, isSelected: true, isShowDetail: $isShowDetail)
//                            .onTapGesture {
//                                skinType = selection.skinType
//                                print(skinType)
//                            }
//                        
                    }
                    
                    NavigationLink(destination: QuizView(quizFrom: .onboard)) { // Menggunakan NavigationLink untuk pergi ke halaman berikutnya
                        Text("Don’t know your skin type?")
                            .frame(width: 359, height: 75)
                            .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                
                Button(action: {
                    isPicked = true
                    skinTypePersistance = skinType
                }, label: {
                    Text("Next")
                        .foregroundColor(Color(red: 0.981, green: 0.981, blue: 0.981))
                        .frame(width: 359, height: 50)
                        .background(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(20)
                        .foregroundStyle(.white)
                })
                
                .navigationDestination(isPresented: $isPicked){
                    if(skinTypePersistance != .none){
                        ViewController()
                            .navigationBarBackButtonHidden()
                    }
                }
                
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

// SelectionSkinView.swift



struct SelectSkinView: View {
    
    var selection: SelectionSkin
    var isSelected: Bool
    
    @State var isShowDetail: Bool = false
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: selection.imageName)
                .resizable()
                .frame(width: 35, height: 35)
                .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
            
            VStack {
                Text(selection.skinType.description)
                    .font(.system(size: 20, weight: .medium))
                    .frame(maxWidth: 250, alignment: .leading)
                Text(selection.declaration)
                    .font(.system(size: 17, weight: .medium))
                    .frame(maxWidth: 250, alignment: .leading)
                    .foregroundColor(.gray)
                    .padding(.bottom, 6)
            }
            Button(action: {
                isShowDetail = true
            }, label: {
                Image(systemName: selection.info)
                    .resizable()
                    .frame(width: 22, height: 22)
                .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))         
            })
            
        }
        .padding()
        .frame(width: 359, height: 75)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1)
        )
        .background(isSelected ? Color.green.opacity(0.2) : .clear)
        .sheet(isPresented: $isShowDetail, content: {
            VStack {
                Button {
                    isShowDetail = false
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.greenAccent)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding()
                
                InfoSkinView(skinType: selection.skinType)
            }
        })
    }
}
