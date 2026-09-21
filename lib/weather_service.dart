import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Contoh fungsi untuk mengambil prediksi atau kondisi cuaca real-time
  static Future<String> cekKondisiCuaca(String lokasi) async {
    try {
      // Di sini kita bisa menyambungkan ke endpoint API cuaca publik atau BMKG
      // Contoh simulasi respons berbasis parameter empiris & wening
      bool adaPotensiHujanSore = true; // Contoh hasil pembacaan data
      
      if (adaPotensiHujanSore) {
        return "Analisis ZF: Terdeteksi kelembapan tinggi dan penurunan tekanan udara. Sore ini berpotensi besar turun hujan di wilayah $lokasi.";
      } else {
        return "Analisis ZF: Atmosfer terpantau stabil dan selaras. Sore ini diprediksi cerah.";
      }
    } catch (e) {
      return "Gagal menyelaraskan data cuaca eksternal: $e";
    }
  }
}
