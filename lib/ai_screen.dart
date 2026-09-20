import 'package:flutter/material.dart';

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
                      border: InputBorder.none,
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
