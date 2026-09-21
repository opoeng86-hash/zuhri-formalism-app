import 'package:flutter/material.dart';

void main() {
  runApp(const ZuhriFormalismApp());
}

class ZuhriFormalismApp extends StatelessWidget {
  const ZuhriFormalismApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZF-Core Global & Nusantara Alert',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.redAccent,
        ),
      ),
      home: const DisasterAlertHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DisasterAlertHomePage extends StatefulWidget {
  const DisasterAlertHomePage({Key? key}) : super(key: key);

  @override
  State<DisasterAlertHomePage> createState() => _DisasterAlertHomePageState();
}

class _DisasterAlertHomePageState extends State<DisasterAlertHomePage> {
  String statusGlobal = "GLOBAL: TERMONITOR STABIL";
  String statusNusantara = "NUSANTARA: WASPADA ANOMALI MUSIM";
  Color statusColor = Colors.orangeAccent;
  
  String infoGunung = "Gunung Berapi: Status Normal (Monitoring Semeru, Merapi, Agung)";
  String infoBanjir = "Banjir/Hidrometeorologi: Siaga potensi curah hujan tinggi regional";
  String infoBadai = "Badai & Siklon: Terdeteksi pusaran angin di wilayah perairan selatan";
  String infoGempa = "Seismik/Gempa: Aktivitas lempeng termonitor secara real-time";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZF-Core Disaster Warning'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1F1F1F),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: const Color(0xFF1E1E1E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: statusColor, width: 1.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'PUSAT KESIAPSIAGAAN BENCANA',
                      style: TextStyle(fontSize: 13, color: Colors.grey, letterSpacing: 1.2),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      statusNusantara,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: statusColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      statusGlobal,
                      style: const TextStyle(fontSize: 14, color: Colors.blueAccent, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Monitoring Ancaman & Mitigasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            _buildDisasterCard('Aktivitas Gunung Meletus', infoGunung, Icons.volcano, Colors.redAccent),
            const SizedBox(height: 10),
            _buildDisasterCard('Potensi Banjir & Genangan', infoBanjir, Icons.flood, Colors.blueAccent),
            const SizedBox(height: 10),
            _buildDisasterCard('Badai & Siklon Tropis', infoBadai, Icons.storm, Colors.purpleAccent),
            const SizedBox(height: 10),
            _buildDisasterCard('Aktivitas Seismik / Gempa', infoGempa, Icons.tsunami, Colors.orangeAccent),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  statusNusantara = "NUSANTARA: SIAGA DARURAT BENCANA";
                  statusGlobal = "GLOBAL: ANOMALI KLIMAT TERDETEKSI";
                  statusColor = Colors.red;
                  infoGunung = "PERINGATAN: Peningkatan aktivitas vulkanik terdeteksi di salah satu simpul jalur aktif.";
                  infoBanjir = "PERINGATAN: Siaga evakuasi dini untuk daerah aliran sungai utama.";
                  infoBadai = "PERINGATAN: Waspada kecepatan angin ekstrem dan gelombang tinggi.";
                  infoGempa = "PERINGATAN: Rekaman sensor menunjukkan fluktuasi mikroseismik.";
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Sinkronisasi data global & nusantara diperbarui!')),
                );
              },
              icon: const Icon(Icons.sync),
              label: const Text('Sinkronisasi Data Real-Time'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[800],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDisasterCard(String title, String description, IconData icon, Color color) {
    return Card(
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: color, size: 36),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(description, style: const TextStyle(fontSize: 13, color: Colors.white70)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
