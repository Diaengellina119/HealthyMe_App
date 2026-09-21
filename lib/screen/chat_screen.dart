import 'package:flutter/material.dart';
import '../main.dart'; // untuk AppColors

// File ini: lib/screen/chat_screen.dart
// Cara pakai: panggil dari list dokter (misal chat_dengan_dokter_screen.dart
// atau doctor_screen.dart) pas user tap satu dokter, contoh:
//   Navigator.push(context, MaterialPageRoute(
//     builder: (_) => const ChatScreen(doctorName: 'Dr. Olivia Turner'),
//   ));

class ChatMessageData {
  final String? text;
  final String time;
  final bool isMe;
  final bool isVoice;
  final String? voiceDuration;

  const ChatMessageData({
    this.text,
    required this.time,
    required this.isMe,
    this.isVoice = false,
    this.voiceDuration,
  });
}

class ChatScreen extends StatefulWidget {
  final String doctorName;

  const ChatScreen({super.key, this.doctorName = 'Dr. Olivia Turner'});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final List<ChatMessageData> _messages = const [
    ChatMessageData(
      isMe: true,
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '09:00',
    ),
    ChatMessageData(
      isMe: false,
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '09:30',
    ),
    ChatMessageData(
      isMe: true,
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      time: '09:43',
    ),
    ChatMessageData(
      isMe: false,
      isVoice: true,
      voiceDuration: '02:50',
      time: '09:50',
    ),
    ChatMessageData(
      isMe: true,
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      time: '09:55',
    ),
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final message in _messages) ...[
                  _buildMessageBubble(context, message),
                  const SizedBox(height: 16),
                ],
                _buildTypingIndicator(),
              ],
            ),
          ),
          _buildInputBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded,
            color: AppColors.white, size: 20),
        onPressed: () => Navigator.maybePop(context),
      ),
      title: Text(
        widget.doctorName,
        style: const TextStyle(
            color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 17),
      ),
      actions: [
        _buildAppBarIcon(Icons.headset_mic_outlined, () {}),
        _buildAppBarIcon(Icons.videocam_outlined, () {}),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildAppBarIcon(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.white, size: 18),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(BuildContext context, ChatMessageData message) {
    final alignment =
        message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bubbleColor =
        message.isMe ? AppColors.primary : AppColors.primaryLight;
    final textColor = message.isMe ? AppColors.white : AppColors.dark;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: message.isVoice
              ? _buildVoiceMessage(message, textColor)
              : Text(
                  message.text ?? '',
                  style: TextStyle(color: textColor, fontSize: 13, height: 1.4),
                ),
        ),
        const SizedBox(height: 4),
        Text(
          message.time,
          style: const TextStyle(color: AppColors.grey, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildVoiceMessage(ChatMessageData message, Color textColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.primary,
          child: Icon(Icons.person, color: AppColors.white, size: 16),
        ),
        const SizedBox(width: 10),
        Container(
          width: 34,
          height: 34,
          decoration: const BoxDecoration(
              color: AppColors.primary, shape: BoxShape.circle),
          child: const Icon(Icons.play_arrow_rounded,
              color: AppColors.white, size: 20),
        ),
        const SizedBox(width: 8),
        Container(
          width: 90,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.3),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(message.voiceDuration ?? '',
            style: TextStyle(color: textColor, fontSize: 11)),
      ],
    );
  }

  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 8),
      child: Text(
        '${widget.doctorName} is typing...',
        style: const TextStyle(
            color: AppColors.primary,
            fontSize: 12,
            fontStyle: FontStyle.italic),
      ),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const Icon(Icons.attach_file_rounded,
                color: AppColors.grey, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  hintText: 'Write Here...',
                  hintStyle: TextStyle(color: AppColors.grey, fontSize: 13),
                  border: InputBorder.none,
                ),
              ),
            ),
            const Icon(Icons.mic_none_rounded, color: AppColors.grey, size: 20),
            const SizedBox(width: 8),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  _messageController.clear();
                },
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                      color: AppColors.primary, shape: BoxShape.circle),
                  child: const Icon(Icons.send_rounded,
                      color: AppColors.white, size: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
