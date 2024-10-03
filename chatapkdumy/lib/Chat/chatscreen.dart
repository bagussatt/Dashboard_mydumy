import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatMessage> messages = [];
  final ChatUser user = ChatUser(id: '1', firstName: 'Pengguna');
  final ChatUser otherUser = ChatUser(id: '2', firstName: 'DIYbot');

  final TextEditingController _controller = TextEditingController();

  void addMessage(ChatMessage message) {
    setState(() {
      messages.add(message);
    });
  }

  void onSend(ChatMessage message) {
    if (message.text.trim().isEmpty) {
      return;
    }

    addMessage(message);

    String botResponse;

    // Kondisi if-else untuk menjawab berdasarkan input pengguna
    if (message.text.toLowerCase() == "hi" ||
        message.text.toLowerCase() == "halo") {
      botResponse = "Halo! Ada yang bisa saya bantu hari ini?";
    } else if (message.text.toLowerCase() == "apa kabar?") {
      botResponse =
          "Saya adalah bot, tapi saya baik-baik saja! Bagaimana dengan kamu?";
    } else if (message.text.toLowerCase() == "terima kasih" ||
        message.text.toLowerCase() == "kabar baik" ||
        message.text.toLowerCase() == "baik") {
      botResponse =
          "Sama-sama! Jika ada yang lain, jangan ragu untuk bertanya.";
    } else if (message.text.toLowerCase() == "siapa namamu?") {
      botResponse =
          "Saya adalah bot yang siap membantu! Ada yang bisa saya bantu?";
    } else if (message.text.toLowerCase() == "tolong") {
      botResponse =
          "Apa Yang bisa kubantu Kamu memiliki 1. masalah di Bagian Atap 2. memiliki masalah di dinding 3. saluran air";
    } else if (message.text.toLowerCase() == "Saluran Air" ||
        message.text.toLowerCase() == "2") {
      botResponse = "Seberapa Parah Masalah Pipa mu";
    } else {
      botResponse = "YANG BENER KONTOL KETIKNYA ANJENG";
    }

    // Simulasi jawaban bot
    Future.delayed(Duration(seconds: 1), () {
      addMessage(
        ChatMessage(
          text: botResponse,
          user: otherUser,
          createdAt: DateTime.now(),
        ),
      );
    });

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Dummy'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 173, 102, 16), Colors.blue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0), // Jarak bawah chat
                child: DashChat(
                  currentUser: user,
                  onSend: (message) => onSend(message),
                  messages: messages,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
