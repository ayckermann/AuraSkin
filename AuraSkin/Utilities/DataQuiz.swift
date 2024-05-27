//
//  DataQuiz.swift
//  AuraSkin
//
//  Created by sri anggraini on 21/05/24.
//

import Foundation

struct Datas {
//    static let questions: [Questions ] = [
//        Questions(query: "Bagaimana tampilan kulitmu?", answerText: ["Berkilau", "Kusam dan rapuh", "Zona T berkilau, tetapi di pipi kusam dan rapuh", "Kemerahan", "Halus dan segar"], progres: 0.1),
//        Questions(query: "Bagaimana ketika disentuh?", answerText: ["Licin", "Kasar", "Zona T licin, tetapi pipi kasar", "Kering dan gatal", "Lembut"], progres: 0.2),
//        Questions(query: "Bagaimana tampilan pori-pori?", answerText: ["Melebar ke seluruh wajah", "Tidak terlihat", "Melebar di zona T saja", "Pori-pori besar", "Tidak terlihat"], progres: 0.3),
//        Questions(query: "Apakah terlihat bersinar?", answerText: ["Di seluruh wajah", "Tidak", "Hanya di zona T", "Tidak tetapi terlihat kemerahan"], progres: 0.4),
//        Questions(query: "Merasakan sesak atau tidak nyaman?", answerText: ["Tidak", "Ya, di semua wajah", "Hanya di pipi dan pelipis", "Ya, di semua wajah", "Tidak"], progres: 0.5),
//        Questions(query: "Apa yang anda rasakan akhir-akhir ini dengan kulit muka anda?", answerText: ["Kulit terlihat berkilau dan berminyak saat disentuh", "Kadang kulit terasa kering ketarik. Sering dehidrasi dan timbul bercak kulit kering", "Berminyak di bagian T-Zone tetapi normal atau kering di bagian pipi dan dagu", "Kering dan gatal di beberapa area wajah. Mudah kemerahan dan kulit terkelupas", "Kulit terasa halus, tidak ada kulit mengelupas ataupun terlalu berminyak"], progres: 0.6)
//    ]
//    
    static let questions: [Questions] = [
        Questions(query: "Bagaimana tampilan kulitmu?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Halus dan segar"),
            QuestionAnswer(forSkinType: .oily, answerText: "Berkilau"),
            QuestionAnswer(forSkinType: .dry, answerText: "Kusam dan Rapuh"),
            QuestionAnswer(forSkinType: .combination, answerText: "Zona T berkilau tetapi di pipi kusam dan rapuh"),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Kemerahan")
        ], point: 12, progres: 0.1),
        Questions(query: "Bagaimana ketika disentuh?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Lembut"),
            QuestionAnswer(forSkinType: .oily, answerText: "Licin"),
            QuestionAnswer(forSkinType: .dry, answerText: "Kasar"),
            QuestionAnswer(forSkinType: .combination, answerText: "Zona T Licin tetapi pipi kasar"),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Kering dan gatal")
        ], point: 12, progres: 0.2),
        Questions(query: "Bagaimana tampilan pori-pori?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Tidak terlalu besar atau terlalu kecil dan umumnya tidak terlihat mencolok"),
            QuestionAnswer(forSkinType: .oily, answerText: "Terlihat jelas, besar, dan terkadang tersumbat"),
            QuestionAnswer(forSkinType: .dry, answerText: "Cenderung lebih kecil dan kurang terlihat"),
            QuestionAnswer(forSkinType: .combination, answerText: "Pori pori lebih besar di zona T(dahi, hidung, dan dagu) dan kecil di area pipi"),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Tampak meradang atau kemerahan ketika terjadi reaksi iritasi")

        ], point: 12, progres: 0.3),
        Questions(query: "Masalah utama uang terjadi pada kulit kamu?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Tidak ada masalah yang signifikan"),
            QuestionAnswer(forSkinType: .oily, answerText: "Komedo dan jerawat"),
            QuestionAnswer(forSkinType: .dry, answerText: "Kekeringan atau iritasi"),
            QuestionAnswer(forSkinType: .combination, answerText: "Zona T(dahi, hidung, dan dagu) cenderung lebih rentan terhadap jerawat dan komedo"),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Sering tampak kemerahan dan bisa meradang")

        ], point: 12, progres: 0.4),
        Questions(query: "Bagaimana keadaan kulit kamu setelah 30 menit mencuci muka dan tidak menggunakan product apapun?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Halus dan lembut"),
            QuestionAnswer(forSkinType: .oily, answerText: "Terlihat mengkilap"),
            QuestionAnswer(forSkinType: .dry, answerText: "Butuh pelembab"),
            QuestionAnswer(forSkinType: .combination, answerText: "Berminyak, kering, dan umumnya tidak rata"),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Area tertentu tampak kering, dan mungkin tampak merah")
        ], point: 12, progres: 0.5),
        Questions(query: "Apa yang anda rasakan akhir-akhir ini dengan kulit muka anda?", questionAnswer: [
            QuestionAnswer(forSkinType: .normal, answerText: "Kulit terasa halus, tidak ada kulit mengelupas ataupun terlalu berminyak."),
            QuestionAnswer(forSkinType: .oily, answerText: "Kulit terlihat berkilau dan berminyak saat disentuh."),
            QuestionAnswer(forSkinType: .dry, answerText: "Kadang kulit terasa kering ketarik. Sering dehidrasi dan timbul bercak kulit kering."),
            QuestionAnswer(forSkinType: .combination, answerText: "Berminyak di bagian T-Zone tetapi normal atau kering di bagian pipi dan dagu."),
            QuestionAnswer(forSkinType: .sensitive, answerText: "Kering dan gatal di beberapa area wajah. Mudah kemerahan dan kulit terkelupas.")
        ], point: 40, progres: 0.6)

    
    ]
}
