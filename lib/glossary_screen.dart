import 'package:flutter/material.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> glossaryData = const [
    {"no": "1", "title": "Konstanta Zuhri", "symbol": "πeff", "desc": "Operator geometri pengunci energi menjadi massa."},
    {"no": "2", "title": "Bit-Massa", "symbol": "mb", "desc": "Bobot fisik dari satu satuan informasi."},
    {"no": "3", "title": "Bit-Space", "symbol": "Vbit", "desc": "Volume terkecil ruang sebagai wadah informasi."},
    {"no": "4", "title": "Indeks Kerapatan", "symbol": "Δn", "desc": "Kuantitas massa intrinsik sebelum proses geometri."},
    {"no": "5", "title": "Panjang Planck Zuhri", "symbol": "lpz", "desc": "Batas terkecil ruang yang dapat ditenun."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glosarium ZF', style: TextStyle(fontSize: 14)),
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
