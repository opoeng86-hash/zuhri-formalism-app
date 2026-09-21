import 'package:flutter/material.dart';
import 'weather_service.dart';

class AIScreen extends StatefulWidget {
  const AIScreen({super.key});

  @override
  State<AIScreen> createState() => _AIScreenState();
}

class _AIScreenState extends State<AIScreen> {
  final TextEditingController _queryController = TextEditingController();
  String _responseResult = "Silakan tanyakan kondisi alam atau cuaca sore ini...";
  bool _isLoading = false;

  void _prosesPertanyaan() async {
    String query = _queryController.text.trim();
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _responseResult = "Menyelaraskan data dan menganalisis parameter alam...";
    });

    // Memanggil layanan cuaca / analisis ZF
    String hasilAnalisis = await WeatherService.cekKondisiCuaca(query);

    setState(() {
      _isLoading = false;
      _responseResult = hasilAnalisis;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZF-AI: Analisis Fenomena Alam'),
        backgroundColor: Colors.teal[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Tanyakan Prediksi Alam & Cuaca:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.tealAccent),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _queryController,
              decoration: const InputDecoration(
                hintText: "Contoh: Apakah nanti sore hujan di Jakarta?",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.cloud_queue, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[700],
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              onPressed: _isLoading ? null : _prosesPertanyaan,
              child: _isLoading 
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text('Kirim Pertanyaan ke ZF-Core', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.teal),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _responseResult,
                    style: const TextStyle(fontSize: 16, color: Colors.greenAccent, height: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
