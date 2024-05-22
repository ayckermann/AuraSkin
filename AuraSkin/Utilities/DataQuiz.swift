//
//  DataQuiz.swift
//  AuraSkin
//
//  Created by sri anggraini on 21/05/24.
//

import Foundation

struct Datas {
    static let questions: [Questions ] = [
        Questions(query: "Bagaimana tampilan kulitmu?", answerText: ["Berkilau", "Kusam dan rapuh", "Zona T berkilau, tetapi di pipi kusam dan rapuh", "Kemerahan", "Halus dan segar"], progres: 0.1),
        Questions(query: "Bagaimana ketika disentuh?", answerText: ["Licin", "Kasar", "Zona T licin, tetapi pipi kasar", "Kering dan gatal", "Lembut"], progres: 0.2),
        Questions(query: "Bagaimana tampilan pori-pori?", answerText: ["Melebar ke seluruh wajah", "Tidak terlihat", "Melebar di zona T saja", "Pori-pori besar", "Tidak terlihat"], progres: 0.3),
        Questions(query: "Apakah terlihat bersinar?", answerText: ["Di seluruh wajah", "Tidak", "Hanya di zona T", "Tidak tetapi terlihat kemerahan"], progres: 0.4),
        Questions(query: "Merasakan sesak atau tidak nyaman?", answerText: ["Tidak", "Ya, di semua wajah", "Hanya di pipi dan pelipis", "Ya, di semua wajah", "Tidak"], progres: 0.5),
        Questions(query: "Apa yang anda rasakan akhir-akhir ini dengan kulit muka anda?", answerText: ["Kulit terlihat berkilau dan berminyak saat disentuh", "Kadang kulit terasa kering ketarik. Sering dehidrasi dan timbul bercak kulit kering", "Berminyak di bagian T-Zone tetapi normal atau kering di bagian pipi dan dagu", "Kering dan gatal di beberapa area wajah. Mudah kemerahan dan kulit terkelupas", "Kulit terasa halus, tidak ada kulit mengelupas ataupun terlalu berminyak"], progres: 0.6)
    ]
}
