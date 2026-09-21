import 'package:flutter/material.dart';
import 'dart:async'; // Diperlukan untuk timer jam real-time

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
  String statusGlobal = "GLOBAL: TERMONITOR STABIL (Kardashev Simpul A)";
  String statusNusantara = "NUSANTARA: WASPADA ANOMALI MUSIM";
  String levelAncaman = "LEVEL 2: SIAGA TERBATAS";
  Color statusColor = Colors.orangeAccent;
  
  String infoGunung = "Gunung Berapi: Status Normal (Monitoring Semeru, Merapi, Agung)";
  String infoBanjir = "Banjir/Hidrometeorologi: Siaga potensi curah hujan tinggi regional";
  String infoBadai = "Badai & Siklon: Terdeteksi pusaran angin di wilayah perairan selatan";
  String infoGempa = "Seismik/Gempa: Aktivitas lempeng termonitor secara real-time";

  // Variabel Waktu Real-Time
  String _waktuAktif = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _perbaruiWaktu();
    // Memperbarui jam setiap detik secara otomatis
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _perbaruiWaktu();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _perbaruiWaktu() {
    final now = DateTime.now();
    setState(() {
      _waktuAktif = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')} WIB";
    });
  }

  final List<String> _riwayatLog = [
    "Sistem diinisialisasi: Pemantauan simpul aktif berjalan normal."
  ];

  void _sinkronisasiData() {
    setState(() {
      statusNusantara = "NUSANTARA: SIAGA DARURAT BENCANA";
      statusGlobal = "GLOBAL: ANOMALI KLIMAT TERDETEKSI (Zuhri Formalism Zone)";
      levelAncaman = "LEVEL 4: AWAS / DARURAT NASIONAL";
      statusColor = Colors.red;
      infoGunung = "PERINGATAN: Peningkatan aktivitas vulkanik terdeteksi di jalur aktif.";
      infoBanjir = "PERINGATAN: Siaga evakuasi dini daerah aliran sungai.";
      infoBadai = "PERINGATAN: Waspada kecepatan angin ekstrem dan gelombang tinggi.";
      infoGempa = "PERINGATAN: Rekaman sensor menunjukkan fluktuasi mikroseismik.";

      String jamPesan = TimeOfDay.now().format(context);
      _riwayatLog.insert(0, "[$jamPesan] Sinkronisasi: Level 4 Awas Diaktifkan.");
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sinkronisasi penuh: Status darurat diaktifkan!')),
    );
  }

  void _resetStatus() {
    setState(() {
      statusGlobal = "GLOBAL: TERMONITOR STABIL (Kardashev Simpul A)";
      statusNusantara = "NUSANTARA: WASPADA ANOMALI MUSIM";
      levelAncaman = "LEVEL 2: SIAGA TERBATAS";
      statusColor = Colors.orangeAccent;
      infoGunung = "Gunung Berapi: Status Normal (Monitoring Semeru, Merapi, Agung)";
      infoBanjir = "Banjir/Hidrometeorologi: Siaga potensi curah hujan tinggi regional";
      infoBadai = "Badai & Siklon: Terdeteksi pusaran angin di wilayah perairan selatan";
      infoGempa = "Seismik/Gempa: Aktivitas lempeng termonitor secara real-time";

      String jamPesan = TimeOfDay.now().format(context);
      _riwayatLog.insert(0, "[$jamPesan] Reset: Sistem Dipulihkan ke Normal.");
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Sistem dipulihkan ke status normal.')),
    );
  }

  void _broadcastDarurat() {
    String jamPesan = TimeOfDay.now().format(context);
    setState(() {
      _riwayatLog.insert(0, "[$jamPesan] BROADCAST: Sinyal Darurat Disebarkan ke Pusat Komando.");
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text('Broadcast Darurat', style: TextStyle(color: Colors.redAccent)),
        content: const Text('Sinyal koordinat dan peringatan dini wilayah nusantara & global berhasil dikirimkan ke pusat komando.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup', style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }

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
            // KARTU STATUS UTAMA (Dilengkapi Jam Real-Time & Wilayah Global)
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: statusColor),
                          ),
                          child: Text(
                            levelAncaman,
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: statusColor),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: Colors.white60),
                            const SizedBox(width: 4),
                            Text(
                              _waktuAktif,
                              style: const TextStyle(fontSize: 12, color: Colors.white70, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      statusNusantara,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: statusColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      statusGlobal,
                      style: const TextStyle(fontSize: 13, color: Colors.blueAccent, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Tombol Siaran Darurat Cepat
            ElevatedButton.icon(
              onPressed: _broadcastDarurat,
              icon: const Icon(Icons.warning_amber_rounded, color: Colors.white),
              label: const Text('Kirim Broadcast Darurat Komando'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[800],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
            
            // Tombol Aksi (Sinkronisasi & Reset)
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _sinkronisasiData,
                    icon: const Icon(Icons.sync, size: 18),
                    label: const Text('Sinkronisasi'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[800],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _resetStatus,
                    icon: const Icon(Icons.refresh, size: 18, color: Colors.orangeAccent),
                    label: const Text('Reset Normal', style: TextStyle(color: Colors.orangeAccent)),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.orangeAccent),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // Log Riwayat Sensor
            const Text(
              'Log Riwayat Sensor & Peringatan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white12),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _riwayatLog.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('• ', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Text(
                            _riwayatLog[index],
                            style: const TextStyle(fontSize: 13, color: Colors.white60),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
