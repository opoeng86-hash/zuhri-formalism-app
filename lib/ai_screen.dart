import 'package:flutter/material.dart';

class ZFAiScreen extends StatefulWidget {
  const ZFAiScreen({Key? key}) : super(key: key);

  @override
  State<ZFAiScreen> createState() => _ZFAiScreenState();
}

class _ZFAiScreenState extends State<ZFAiScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      "sender": "ai", 
      "text": "Salam. Saya adalah asisten AI tematik Zuhri Formalism. Silakan masukkan istilah seperti 'Konstanta Zuhri', 'Bit-Massa', atau 'Planck' untuk analisis parameter."
    }
  ];

  // Basis pengetahuan lokal berbasis parameter Zuhri Formalism
  String _getZfResponse(String query) {
    String q = query.toLowerCase();
    if (q.contains('konstanta') || q.contains('pi')) {
      return "Konstanta Zuhri (πeff): Operator geometri fundamental yang berfungsi mengunci energi murni menjadi massa terukur di dalam arsitektur ruang-waktu.";
    } else if (q.contains('bit-massa') || q.contains('massa')) {
      return "Bit-Massa (mb): Bobot fisik kuantitatif dari satu satuan informasi dasar yang menyusun struktur material.";
    } else if (q.contains('bit-space') || q.contains('ruang') || q.contains('volume')) {
      return "Bit-Space (Vbit): Volume terkecil dari ruang yang bertindak sebagai wadah fundamental bagi keberadaan informasi.";
    } else if (q.contains('kerapatan') || q.contains('indeks')) {
      return "Indeks Kerapatan (Δn): Besaran kuantitas massa intrinsik sebelum proses penenunan geometri ruang dilangsungkan.";
    } else if (q.contains('planck') || q.contains('lpz')) {
      return "Panjang Planck Zuhri (lpz): Batas resolusi spasial terkecil di mana ruang dapat ditenun secara struktural.";
    } else {
      return "Analisis untuk '$query' merujuk pada prinsip mekanika dan parameter dasar dalam kerangka kerja Abah Muhammad Zuhri. Masukkan kata kunci seperti 'Konstanta Zuhri' atau 'Bit-Massa' untuk detail spesifik.";
    }
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    String userText = _controller.text;
    
    setState(() {
      _messages.add({"sender": "user", "text": userText});
      String aiResponse = _getZfResponse(userText);
      _messages.add({"sender": "ai", "text": aiResponse});
    });
    
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konsultan AI Zuhri Formalism', style: TextStyle(fontSize: 14)),
        backgroundColor: const Color(0xFF131B2E),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                bool isUser = msg["sender"] == "user";
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF7C4DFF) : const Color(0xFF131B2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg["text"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 13, height: 1.3),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFF131B2E),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Tanya parameter ZF (misal: Konstanta)...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF00E5FF)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
