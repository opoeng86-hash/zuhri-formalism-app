import 'package:flutter/material.dart';
import 'zf_core.dart'; // Menghubungkan ke file inti rumus yang sudah kita buat

void main() {
  runApp(const ZuhriFormalismApp());
}

class ZuhriFormalismApp extends StatelessWidget {
  const ZuhriFormalismApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zuhri Formalism Core',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
      ),
      home: const KalkulatorZFScreen(),
    );
  }
}

class KalkulatorZFScreen extends StatefulWidget {
  const KalkulatorZFScreen({super.key});

  @override
  State<KalkulatorZFScreen> createState() => _KalkulatorZFScreenState();
}

class _KalkulatorZFScreenState extends State<KalkulatorZFScreen> {
  // Controller untuk mengambil input dari pengguna
  final TextEditingController _ctrlD = TextEditingController(text: '10');
  final TextEditingController _ctrlL = TextEditingController(text: '10');
  final TextEditingController _ctrlPsi = TextEditingController(text: '10');
  final TextEditingController _ctrlW = TextEditingController(text: '5');
  final TextEditingController _ctrlA = TextEditingController(text: '5');
  final TextEditingController _ctrlM = TextEditingController(text: '5');

  String _hasilIndeks = "Belum dihitung";

  void _hitung() {
    try {
      double d = double.parse(_ctrlD.text);
      double l = double.parse(_ctrlL.text);
      double psi = double.parse(_ctrlPsi.text);
      double w = double.parse(_ctrlW.text);
      double a = double.parse(_ctrlA.text);
      double m = double.parse(_ctrlM.text);

      // Memanggil fungsi dari zf_core.dart
      double hasil = ZuhriFormalismCore.hitungIndeksZF(
        dataD: d,
        logikaL: l,
        intuisiPsi: psi,
        duniaW: w,
        akhiratA: a,
        manfaatM: m,
      );

      setState(() {
        _hasilIndeks = hasil.toStringAsFixed(4);
      });
    } catch (e) {
      setState(() {
        _hasilIndeks = "Error: Pastikan angka valid & penyebut bukan 0";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZF-Core: Kalkulator Keselarasan'),
        backgroundColor: Colors.teal[800],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Masukkan Parameter Mikrokosmos & Makrokosmos",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            const SizedBox(height: 15),
            _buildTextField(_ctrlD, 'Data (D) - Informasi Empiris'),
            _buildTextField(_ctrlL, 'Logika (L) - Struktur Berpikir'),
            _buildTextField(_ctrlPsi, 'Intuisi (Ψ) - Kesadaran Wening'),
            _buildTextField(_ctrlW, 'Dunia (W) - Amal / Kerja Nyata'),
            _buildTextField(_ctrlA, 'Akhirat (A) - Orientasi Transendental'),
            _buildTextField(_ctrlM, 'Manfaat (M) - Dampak Sosial'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _hitung,
              child: const Text('Hitung Indeks I_ZF', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 25),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal),
              ),
              child: Column(
                children: [
                  const Text('Hasil Indeks Keselarasan (I_ZF):', style: TextStyle(color: Colors.white70)),
                  const SizedBox(height: 8),
                  Text(
                    _hasilIndeks,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.greenAccent),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white60),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderElement(color: Colors.teal, width: 2),
          ),
        ),
      ),
    );
  }
}
