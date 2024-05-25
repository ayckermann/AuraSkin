//
//  Question.swift
//  AuraSkin
//
//  Created by sri anggraini on 21/05/24.
//

import Foundation

struct Questions {
    let query: String
    let questionAnswer: [QuestionAnswer]
    let point: Int
    let progres: Double
}

struct QuestionAnswer{
    let forSkinType: SkinType
    let answerText: String
}

struct UserAnswer{
    let forSkinType: SkinType
    let point: Int
}
