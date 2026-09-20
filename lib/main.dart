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
                    'Master Archives & AI Engine',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00E5FF),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Pusat kendali arsip parameter fisik, arsitektur dasar, dan asisten AI tematik kerangka kerja Abah Muhammad Zuhri.',
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
            const SizedBox(height: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ZFAiScreen()),
                  );
                },
                icon: const Icon(Icons.psychology, color: Colors.white),
                label: const Text(
                  'KONSULTAN AI ZF (INTELLIGENCE)',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7C4DFF),
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

class ZFAiScreen extends StatefulWidget {
  const ZFAiScreen({Key? key}) : super(key: key);

  @override
  State<ZFAiScreen> createState() => _ZFAiScreenState();
}

class _ZFAiScreenState extends State<ZFAiScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {"sender": "ai", "text": "Salam. Saya adalah asisten AI tematik Zuhri Formalism. Silakan tanyakan mengenai konstanta atau parameter mekanika ruang-waktu."}
  ];

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;
    String userText = _controller.text;
    setState(() {
      _messages.add({"sender": "user", "text": userText});
      _messages.add({
        "sender": "ai", 
        "text": "Analisis parameter untuk '$userText' merujuk pada prinsip dasar Arsitektur dan Konstanta Abah Muhammad Zuhri."
      });
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
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFF7C4DFF) : const Color(0xFF131B2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      msg["text"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
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
                      hintText: 'Tulis pertanyaan atau parameter ZF...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputFileBorder.none,
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
