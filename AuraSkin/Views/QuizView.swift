//
//  QuizView.swift
//  AuraSkin
//
//  Created by sri anggraini on 21/05/24.
//

import SwiftUI

struct QuizView: View {
    @State private var currentQuestionIndex = 0
    @State private var progress: Double = 0.1
    @State private var selectedAnswer: Int? = nil
    
    @State var userAnswer : [UserAnswer] = []
    
    func insertOrReplace<T>(array: inout [T], value: T, at index: Int) {
        // Check if the index is within bounds of the array
        if index >= 0 && index < array.count {
            // Replace the value at the specified index
            array[index] = value
        } else if index == array.count {
            // If the index is equal to the array count, append the value
            array.append(value)
        } else {
            // Handle the case where the index is out of bounds
            print("Index out of bounds")
        }
    }
    
    
    func setAnswer(questionIndex: Int,point: Int, skinType:SkinType){
        insertOrReplace(array: &userAnswer, value: UserAnswer(forSkinType: skinType, point: point), at: questionIndex)
        print(userAnswer.description)
        
        
    }
    
    func getSkinType() -> SkinType{
        var oilyPoint: Int = 0
        var dryPoint: Int = 0
        var normalPoint: Int = 0
        var combinationPoint: Int = 0
        var sensitivePoint: Int = 0
        
        userAnswer.forEach { answer in
            switch answer.forSkinType{
                
            case .normal:
                normalPoint = normalPoint + answer.point
            case .oily:
                oilyPoint = oilyPoint + answer.point
            case .dry:
                dryPoint = dryPoint + answer.point
            case .combination:
                combinationPoint = combinationPoint + answer.point
            case .sensitive:
                sensitivePoint = sensitivePoint + answer.point
            case .none: break
                //
            case .combinationDry: break
                
            case .combinationOily: break
                
            }
        }
        
        let highest = max(oilyPoint, dryPoint, normalPoint, combinationPoint, sensitivePoint)
        
        if(oilyPoint == highest){
            return .oily
        } else if(dryPoint == highest){
            return .dry
        } else if(sensitivePoint == highest){
            return .sensitive
        } else if(combinationPoint == highest){
            return .combination
        } else{
            return .normal
        }
        
        
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Question \(currentQuestionIndex + 1) out of \(Datas.questions.count)")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .padding(.bottom, 30)
                
                VStack(alignment: .leading, spacing: 20) {
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(width: 360, height: 20)
                        
                        Rectangle()
                            .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                            .frame(width: CGFloat(progress * 600), height: 20)
                            .cornerRadius(10)
                    }.cornerRadius(10)
                    
                    Text(Datas.questions[currentQuestionIndex].query)
                        .font(.system(size: 29, weight: .bold))
                    
                    Text("Select one option")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                    
                    if(userAnswer.indices.contains(currentQuestionIndex)){
                        ForEach(0..<Datas.questions[currentQuestionIndex].questionAnswer.count, id: \.self) { index in
                            
                            let skinType =  Datas.questions[currentQuestionIndex].questionAnswer[index].forSkinType
                            let point =  Datas.questions[currentQuestionIndex].point
                            
                            if(userAnswer[currentQuestionIndex].forSkinType == skinType){
                                CQuestionView(question: Datas.questions[currentQuestionIndex].questionAnswer[index].answerText, isSelected: true)
                                    .onTapGesture {
                                        selectedAnswer = index
                                        setAnswer(questionIndex: currentQuestionIndex, point: point , skinType: skinType)
                                        
                                    }
                                
                            }
                            else{
                                CQuestionView(question: Datas.questions[currentQuestionIndex].questionAnswer[index].answerText, isSelected: selectedAnswer == index)
                                    .onTapGesture {
                                        selectedAnswer = index
                                        setAnswer(questionIndex: currentQuestionIndex, point: point , skinType: skinType)
                                        
                                    }
                            }
                            
                        }
                    }
                    else{
                        ForEach(0..<Datas.questions[currentQuestionIndex].questionAnswer.count, id: \.self) { index in
                            
                            let skinType =  Datas.questions[currentQuestionIndex].questionAnswer[index].forSkinType
                            let point =  Datas.questions[currentQuestionIndex].point
                            
                            CQuestionView(question: Datas.questions[currentQuestionIndex].questionAnswer[index].answerText, isSelected: selectedAnswer == index)
                                .onTapGesture {
                                    selectedAnswer = index
                                    setAnswer(questionIndex: currentQuestionIndex, point: point , skinType: skinType)
                                }
                            
                        }
                        
                    }
                    
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                        .frame(width: 16)
                    
                    
                    if currentQuestionIndex > 0 {
                        Button(action: {
                            if currentQuestionIndex > 0 {
                                currentQuestionIndex -= 1
                                progress = Datas.questions[currentQuestionIndex].progres
                                selectedAnswer = nil
                                
                                
                            }
                        }) {
                            HStack {
                                Image(systemName: "arrow.backward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Back")
                                    .fontWeight(.bold)
                            }
                        }
                        .padding()
                        .frame(width: 100.5, height: 40)
                        .foregroundColor(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4), lineWidth: 1)
                        )
                        .disabled(currentQuestionIndex == 0)
                        Spacer()
                        
                    }
                    Spacer()
                    if currentQuestionIndex < Datas.questions.count - 1 {
                        Button(action: {
                            if currentQuestionIndex < Datas.questions.count - 1 {
                                currentQuestionIndex += 1
                                progress = Datas.questions[currentQuestionIndex].progres
                                selectedAnswer = nil
                                
                                
                            }
                        }) {
                            HStack {
                                Text("Next")
                                    .fontWeight(.bold)
                                
                                Image(systemName: "arrow.forward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding()
                        .frame(width: 100.5, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                        .cornerRadius(10)
                        .disabled(!userAnswer.indices.contains(currentQuestionIndex))
                    } else {
                        NavigationLink(destination: OnboardingView().onAppear(){
                            print(getSkinType().description)
                        }) {
                            HStack {
                                Text("Next")
                                    .fontWeight(.bold)
                                
                                Image(systemName: "arrow.forward")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding()
                        .frame(width: 100.5, height: 40)
                        .foregroundColor(Color.white)
                        .background(Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4))
                        .cornerRadius(10)
                        .disabled(!userAnswer.indices.contains(currentQuestionIndex))
                        
                    }
                    
                    Spacer()
                        .frame(width: 16)
                }.padding(.bottom, 30)
            }
        }
    }
}


struct CQuestionView: View {
    var question: String
    var isSelected: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(isSelected ? Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4) : .gray)
            
            Text(question)
                .font(.system(size: 15))
                .foregroundColor(isSelected ? Color(red: 0.0784313725490196, green: 0.36470588235294116, blue: 0.4) : .gray)
        }
        .frame(width: 358, height: 55, alignment: .leading)
        .padding(.leading, 20)
        .background(isSelected ? Color.green.opacity(0.2) : Color(UIColor.systemGray6))
        .cornerRadius(10)
    }
}



struct QView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

#Preview{
    CQuestionView(question: "asdasd", isSelected: true)
}
