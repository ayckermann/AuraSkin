//
//  MedicalDisclaimerView.swift
//  AuraSkin
//
//  Created by Syuhada Rantisi on 20/05/24.
//

import SwiftUI

struct MedicalDisclaimerView: View {
//    @Binding var isSet: Bool

    var body: some View {
        ScrollView {
            VStack {
                Text("Medical Disclaimer")
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(20)
                Text("Aplikasi skincare ini menyediakan informasi umum dan saran terkait perawatan kulit dan produk kecantikan. Informasi ini tidak dimaksudkan sebagai pengganti saran medis profesional, diagnosis, atau perawatan. Konsultasikan selalu dengan dokter atau penyedia layanan kesehatan lainnya mengenai kondisi medis atau perawatan kesehatan yang mungkin Anda butuhkan.\n\nPenolakan Tanggung Jawab:\n\nTidak Ada Saran Medis: Informasi yang disediakan oleh aplikasi ini, termasuk teks, grafik, gambar, dan materi lainnya, hanya bertujuan untuk tujuan informasi umum. Informasi ini tidak dimaksudkan sebagai pengganti konsultasi, saran, atau perawatan medis profesional. Jangan pernah mengabaikan nasihat medis profesional atau menunda mencari saran medis karena informasi yang Anda baca di aplikasi ini.\n\nHasil Individual Mungkin Berbeda: Reaksi terhadap produk skincare dapat bervariasi dari individu ke individu. Apa yang efektif untuk satu orang mungkin tidak efektif untuk orang lain. Aplikasi ini tidak menjamin bahwa penggunaan produk yang disarankan akan memberikan hasil yang diinginkan bagi semua pengguna.\n\nTidak Ada Garansi atau Tanggung Jawab: Aplikasi ini tidak membuat pernyataan atau jaminan apapun terkait kelengkapan, keakuratan, keandalan, kesesuaian, atau ketersediaan informasi yang disediakan. Penggunaan informasi tersebut sepenuhnya merupakan risiko pengguna. Aplikasi ini tidak bertanggung jawab atas kerugian atau kerusakan termasuk, tanpa batasan, kerugian atau kerusakan tidak langsung atau konsekuensial yang timbul dari penggunaan informasi di dalamnya.\n\nKonsultasi dengan Profesional Kesehatan: Untuk setiap masalah kesehatan atau kondisi kulit yang spesifik, pengguna disarankan untuk berkonsultasi dengan dokter atau ahli dermatologi. Informasi di aplikasi ini tidak dimaksudkan untuk menggantikan konsultasi medis atau layanan kesehatan profesional.\n\nDengan menggunakan aplikasi ini, Anda setuju untuk tidak menyalahkan aplikasi atau penyedianya atas tindakan atau keputusan yang diambil berdasarkan informasi yang tersedia di aplikasi ini. Anda juga setuju bahwa tanggung jawab untuk setiap keputusan atau tindakan yang diambil sebagai hasil dari penggunaan informasi di aplikasi ini sepenuhnya ada pada Anda.\n\nJika Anda memiliki pertanyaan atau kekhawatiran mengenai kesehatan kulit Anda, segera hubungi profesional medis yang berkualifikasi.")
            }
            .padding(20)
        }
        .navigationTitle("Medical Disclaimer")
    }
}

#Preview {
    MedicalDisclaimerView()
}

