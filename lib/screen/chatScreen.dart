import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;
  final String avatarUrl;

  const ChatScreen({
    super.key,
    required this.username,
    required this.avatarUrl,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.insert(0, {'text': text, 'isMe': true});
    });
    _controller.clear();
    // You can simulate a reply after a delay here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 0,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(widget.avatarUrl)),
            const SizedBox(width: 10),
            Text(
              widget.username,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.video_call, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.call, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['isMe'];
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isMe ?  Colors.blue : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      message['text'],
                      style: const TextStyle(fontSize: 16,color:Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.grey),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Type a message",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.deepPurple),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
