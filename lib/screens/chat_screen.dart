import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/models/message.dart';
import 'package:luna/theme.dart';
import 'package:luna/widgets/input_bar.dart';
import 'package:luna/widgets/message_bubble.dart';
import 'package:luna/widgets/mode_chip.dart';
import 'package:luna/widgets/luna_bottom_nav.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<LunaMessage> _messages = LunaMessage.sampleMessages();
  String? _activeMode;
  bool _showSaveIndicator = false;

  void _handleSend() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(
        LunaMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: DateTime.now(),
        ),
      );
      _textController.clear();
      _showSaveIndicator = false;
    });

    _scrollToBottom();

    // Simulate Luna response
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _messages.add(
          LunaMessage(
            id: '${DateTime.now().millisecondsSinceEpoch}_luna',
            text:
                'Aku dengar kamu ❤️ Ceritakan lebih banyak ya — aku di sini untuk menemani.',
            isUser: false,
            timestamp: DateTime.now(),
            mode: _activeMode,
          ),
        );
      });
      _scrollToBottom();
    });
  }

  void _handleModeSelected(String mode) {
    setState(() {
      _activeMode = mode;
      _showSaveIndicator = true;
    });
  }

  void _handleSave() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Saved to Diary ✨'),
        backgroundColor: LunaColors.mediumPurple,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 2),
      ),
    );
    setState(() => _showSaveIndicator = false);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/diary');
        break;
      case 1:
        Navigator.pushNamed(context, '/growth');
        break;
      case 2:
        // Luna center — scroll to top, focus input
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        break;
      case 3:
        Navigator.pushNamed(context, '/nutrition');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LunaColors.background,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [LunaColors.mediumPurple, LunaColors.primary],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.auto_awesome, color: LunaColors.white, size: 16),
            ),
            const SizedBox(width: 10),
            Text(
              'Luna',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                color: LunaColors.textPrimary,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: LunaColors.textSecondary,
          ),
        ],
      ),
      body: Column(
        children: [
          // Mode chips
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: LunaColors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ModeChipRow(
              onModeSelected: _handleModeSelected,
              selectedMode: _activeMode,
            ),
          ),
          // Messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(
                  text: message.text,
                  isUser: message.isUser,
                  mode: message.mode,
                );
              },
            ),
          ),
          // Input bar
          LunaInputBar(
            controller: _textController,
            onSend: _handleSend,
            onMic: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('🎤 Voice input coming soon'),
                  backgroundColor: LunaColors.mediumPurple,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            onCamera: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('📷 Camera input coming soon'),
                  backgroundColor: LunaColors.mediumPurple,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            onSave: _handleSave,
            showSaveIndicator: _showSaveIndicator,
          ),
        ],
      ),
      bottomNavigationBar: LunaBottomNav(
        currentIndex: 2,
        onTap: _onNavTap,
      ),
    );
  }
}
