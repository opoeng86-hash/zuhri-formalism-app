// Modul Inti Zuhri Formalism Core (ZF-Core)
// Digunakan untuk menghitung Indeks Keselarasan (I_ZF)

class ZuhriFormalismCore {
  
  // Fungsi perhitungan utama Indeks Keselarasan
  static double hitungIndeksZF({
    required double dataD,      // D: Data / Empathetic Data
    required double logikaL,    // L: Logika / Formal Logic
    required double intuisiPsi, // Psi: Intuisi / Ghaib Consciousness
    required double duniaW,     // W: Dunia / Worldly Action
    required double akhiratA,   // A: Akhirat / Transcendental Orientation
    required double manfaatM,   // M: Manfaat / Social Benefit
  }) {
    // Validasi pencegahan pembagian dengan angka nol
    if (duniaW == 0 || akhiratA == 0 || manfaatM == 0) {
      throw Exception("Penyebut (W, A, atau M) tidak boleh bernilai nol agar terhindar dari singularitas.");
    }

    // Perhitungan Pembilang / Penyebut
    double pembilang = dataD * logikaL * intuisiPsi;
    double penyebut = duniaW * akhiratA * manfaatM;

    // Menghasilkan Nilai Indeks ZF
    return pembilang / penyebut;
  }
}
