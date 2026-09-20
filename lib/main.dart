import 'package:flutter/material.dart';

void main() {
  runApp(const ZuhriFormalismApp());
}

class ZuhriFormalismApp extends StatelessWidget {
  const ZuhriFormalismApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuhri Formalism Core',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        primaryColor: const Color(0xFF00E5FF),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFF7C4DFF),
          surface: Color(0xFF131B2E),
        ),
        fontFamily: 'Roboto',
      ),
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ZUHRI FORMALISM CORE',
          style: TextStyle(
            letterSpacing: 1.5,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00E5FF),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF131B2E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF00E5FF).withOpacity(0.3)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Master Archives & Glossary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5FF),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Akses arsip parameter fisik, arsitektur dasar, dan mekanika fluida ruang-waktu dari kerangka Abah Muhammad Zuhri.',
                    style: TextStyle(fontSize: 12, color: Colors.white60, height: 1.4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GlossaryScreen()),
                  );
                },
                icon: const Icon(Icons.menu_book, color: Color(0xFF0B0F19)),
                label: const Text(
                  'BUKA GLOSARIUM ZF',
                  style: TextStyle(color: Color(0xFF0B0F19), fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E5FF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> glossaryData = const [
    {"no": "1", "title": "Konstanta Zuhri", "symbol": "πeff", "desc": "Operator geometri pengunci energi menjadi massa[span_0](start_span)[span_0](end_span)."},
    {"no": "2", "title": "Bit-Massa", "symbol": "mb", "desc": "Bobot fisik dari satu satuan informasi[span_1](start_span)[span_1](end_span)."},
    {"no": "3", "title": "Bit-Space", "symbol": "Vbit", "desc": "Volume terkecil ruang sebagai wadah informasi[span_2](start_span)[span_2](end_span)."},
    {"no": "4", "title": "Indeks Kerapatan", "symbol": "Δn", "desc": "Kuantitas massa intrinsik sebelum proses geometri[span_3](start_span)[span_3](end_span)."},
    {"no": "5", "title": "Panjang Planck Zuhri", "symbol": "lpz", "desc": "Batas terkecil ruang yang dapat ditenun[span_4](start_span)[span_4](end_span)."},
    {"no": "6", "title": "Massa Planck Zuhri", "symbol": "mpz", "desc": "Ambang batas massa maksimal simpul tunggal[span_5](start_span)[span_5](end_span)."},
    {"no": "7", "title": "Nadi Alam Semesta", "symbol": "fu", "desc": "Frekuensi sinkronisasi seluruh konstanta fisik[span_6](start_span)[span_6](end_span)."},
    {"no": "8", "title": "Metrik Jarak Zuhri", "symbol": "sz", "desc": "Panjang lintasan sejati di dalam tenunan ruang[span_7](start_span)[span_7](end_span)."},
    {"no": "9", "title": "Kepadatan Geometri", "symbol": "ρg", "desc": "Intensitas jalinan energi per satuan volume[span_8](start_span)[span_8](end_span)."},
    {"no": "10", "title": "Garis Lusi Waktu", "symbol": "TL", "desc": "Dimensi temporal yang menghantar energi[span_9](start_span)[span_9](end_span)."},
    {"no": "11", "title": "Garis Pakan Ruang", "symbol": "Rp", "desc": "Dimensi spasial penyangga struktur tenunan[span_10](start_span)[span_10](end_span)."},
    {"no": "12", "title": "Tegangan Benang Primer", "symbol": "τp", "desc": "Energi linear dasar pembentuk partikel[span_11](start_span)[span_11](end_span)."},
    {"no": "13", "title": "Simpul Geometri", "symbol": "Sg", "desc": "Titik penguncian energi menjadi materi[span_12](start_span)[span_12](end_span)."},
    {"no": "14", "title": "Amplitudo Tenun", "symbol": "Aw", "desc": "Intensitas penyimpangan geometri ruang[span_13](start_span)[span_13](end_span)."},
    {"no": "15", "title": "Fase Sinkronisasi", "symbol": "ϕz", "desc": "Sudut keselarasan antar simpul energi[span_14](start_span)[span_14](end_span)."},
    {"no": "16", "title": "Viskositas Ruang Zuhri", "symbol": "ηz", "desc": "Kekentalan vakum yang membatasi kecepatan cahaya[span_15](start_span)[span_15](end_span)."},
    {"no": "17", "title": "Laminaritas Tenun", "symbol": "ℒz", "desc": "Tingkat kestabilan aliran kain ruang-waktu[span_16](start_span)[span_16](end_span)."},
    {"no": "18", "title": "Vortisitas Tenunan", "symbol": "ωz", "desc": "Kecepatan rotasi internal simpul energi[span_17](start_span)[span_17](end_span)."},
    {"no": "19", "title": "Bilangan Reynolds Zuhri", "symbol": "Rez", "desc": "Rasio inersia terhadap viskositas ruang[span_18](start_span)[span_18](end_span)."},
    {"no": "20", "title": "Jepitan Geometri", "symbol": "Gpinch", "desc": "Tekanan pengunci agar foton menjadi massa[span_19](start_span)[span_19](end_span)."},
    {"no": "21", "title": "Elastisitas Kain Kosmik", "symbol": "Ek", "desc": "Daya balik ruang setelah mengalami pelengkungan[span_20](start_span)[span_20](end_span)."},
    {"no": "22", "title": "Pori-Pori Ruang", "symbol": "εz", "desc": "Celah geometri yang mengatur perambatan energi[span_21](start_span)[span_21](end_span)."},
    {"no": "23", "title": "Ambang Batas Robek", "symbol": "σb", "desc": "Batas densitas energi sebelum struktur ruang rusak[span_22](start_span)[span_22](end_span)."},
    {"no": "24", "title": "Resonansi Jarum", "symbol": "fn", "desc": "Getaran pemicu kristalisasi energi menjadi massa[span_23](start_span)[span_23](end_span)."},
    {"no": "25", "title": "Penyusutan Simpul", "symbol": "ΔVs", "desc": "Kontraksi volume ruang akibat tekanan gravitasi[span_24](start_span)[span_24](end_span)."},
    {"no": "26", "title": "Kavitasi Geometri", "symbol": "Kv", "desc": "Gelembung hampa tenunan yang memicu anomali[span_25](start_span)[span_25](end_span)."},
    {"no": "27", "title": "Tegangan Permukaan Dimensi", "symbol": "γd", "desc": "Energi ambang antara dimensi 3D dan dimensi tinggi[span_26](start_span)[span_26](end_span)."},
    {"no": "28", "title": "Modulus Elastisitas Zuhri", "symbol": "Yz", "desc": "Kekakuan kain ruang terhadap tarikan massa[span_27](start_span)[span_27](end_span)."},
    {"no": "29", "title": "Arus Transversal Tenun", "symbol": "Itr", "desc": "Kecepatan getaran mekanis merambat di vakum[span_28](start_span)[span_28](end_span)."},
    {"no": "30", "title": "Hambatan Gesek Geometri", "symbol": "Rg", "desc": "Disipasi energi akibat pergerakan di medium ruang[span_29](start_span)[span_29](end_span)."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glosarium ZF (1-30)', style: TextStyle(fontSize: 14)),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: ListView.builder(
        itemCount: glossaryData.length,
        itemBuilder: (context, index) {
          final item = glossaryData[index];
          return Card(
            color: const Color(0xFF131B2E),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF00E5FF),
                child: Text(item["no"]!, style: const TextStyle(color: Color(0xFF0B0F19), fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              title: Text(item["title"]!, style: const TextStyle(color: Color(0xFF00E5FF), fontWeight: FontWeight.bold, fontSize: 13)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text("Simbol: ${item["symbol"]}", style: const TextStyle(color: Colors.purpleAccent, fontSize: 11)),
                  const SizedBox(height: 2),
                  Text(item["desc"]!, style: const TextStyle(color: Colors.white70, fontSize: 11)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
