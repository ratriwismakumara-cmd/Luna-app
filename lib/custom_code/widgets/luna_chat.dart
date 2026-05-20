// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

/// LunaChat — Luna AI Parenting Companion Home snapshot + mode selector +
/// chat interface
class LunaChat extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaChat({super.key, this.width, this.height});

  @override
  State<LunaChat> createState() => _LunaChatState();
}

class _LunaChatState extends State<LunaChat> {
  // ── Design tokens ──
  static const nightIndigo = Color(0xFF2B2447);
  static const lunaPurple = Color(0xFF6B5FA6);
  static const softLavender = Color(0xFFB9A7D9);
  static const paleLilac = Color(0xFFE7DDF4);
  static const lilacWash = Color(0xFFF4EEF6);
  static const warmCream = Color(0xFFF7EAD6);
  static const champagneGold = Color(0xFFD8B67A);
  static const goldGlow = Color(0xFFE8C77A);
  static const bgWarm = Color(0xFFFBF7F4);
  static const bgWhite = Color(0xFFFCFAF7);
  static const textDeep = Color(0xFF2B2447);
  static const textMuted = Color(0xFF6E687A);
  static const textSoft = Color(0xFF9A93AB);
  static const textFaint = Color(0xFFC5BFD3);
  static const lineSoft = Color(0xFFE7E0EB);
  static const lineFaint = Color(0xFFF0EBF2);
  static const crisisTint = Color(0xFFF7D8D4);
  static const calmTint = Color(0xFFDBE8DC);
  static const insightTint = Color(0xFFDCE3EE);
  static const bondTint = Color(0xFFF2DDE8);

  // ── State ──
  String _screen = 'home'; // 'home', 'category', 'chat'
  String _chatMode = 'reflection';
  final _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final _scrollController = ScrollController();

  static const _modes = [
    {
      'emoji': '💛',
      'name': 'Crisis',
      'desc': 'Meltdown, overwhelm, conflict happening now',
      'key': 'crisis',
      'tint': crisisTint
    },
    {
      'emoji': '🌙',
      'name': 'Reflection',
      'desc': 'Debrief after the moment passed',
      'key': 'reflection',
      'tint': lilacWash
    },
    {
      'emoji': '✨',
      'name': 'Milestone',
      'desc': 'A breakthrough or growth moment',
      'key': 'milestone',
      'tint': warmCream
    },
    {
      'emoji': '🌸',
      'name': 'Bonding',
      'desc': 'Rituals, connection, core memories',
      'key': 'bonding',
      'tint': bondTint
    },
    {
      'emoji': '🌿',
      'name': 'Wellness',
      'desc': 'Sleep, food, energy, routines',
      'key': 'wellness',
      'tint': calmTint
    },
    {
      'emoji': '👁',
      'name': 'Observation',
      'desc': 'Pattern noticing, social changes',
      'key': 'observation',
      'tint': insightTint
    },
  ];

  void _openChat(String modeKey) {
    final mode = _modes.firstWhere((m) => m['key'] == modeKey);
    setState(() {
      _screen = 'chat';
      _chatMode = modeKey;
      _messages.clear();
      _messages.add({
        'type': 'luna',
        'text':
            'Hi. I noticed you wanted to reflect on something from today. Share what happened — I\'ll help you make sense of it, gently.',
        'modeEmoji': mode['emoji'],
        'modeName': mode['name'],
      });
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({'type': 'user', 'text': text.trim()});
      _messages.add({
        'type': 'luna',
        'text':
            'Thank you for sharing. Let me reflect on that with you... 🌙\n\n✦ What happened — it sounds like this moment caught you off-guard.\n✦ Possible triggers — transitions and fatigue may have played a role.\n✦ What worked — staying calm and present helped.\n✦ What to try next time — a 3-minute quiet buffer before transitions.',
        'modeEmoji': _getMode()['emoji'],
        'modeName': _getMode()['name'],
        'hasFramework': true,
      });
    });
    _messageController.clear();
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Map<String, dynamic> _getMode() {
    try {
      return _modes.firstWhere((m) => m['key'] == _chatMode);
    } catch (_) {
      return _modes[1]; // default reflection
    }
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgWarm,
      child: Column(
        children: [
          _buildAppHeader(),
          Expanded(
            child: _screen == 'home'
                ? _buildHomeContent()
                : _screen == 'category'
                    ? _buildCategorySelector()
                    : _buildChatView(),
          ),
        ],
      ),
    );
  }

  // ═══════════ APP HEADER ═══════════
  Widget _buildAppHeader() {
    final titles = {
      'home': ['Today\'s Family Snapshot', 'Your Child · 8 yrs'],
      'category': ['Conversation', 'Luna ✦'],
      'chat': ['Conversation', 'Luna ✦'],
    };
    final t = titles[_screen] ?? titles['home']!;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 14, 24, 8),
      color: bgWarm,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t[0],
                  style: const TextStyle(
                      fontSize: 10,
                      color: textSoft,
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(t[1],
                  style: const TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 24,
                      color: textDeep,
                      letterSpacing: 0.2)),
            ],
          ),
          GestureDetector(
            onTap: () => setState(
                () => _screen = _screen == 'home' ? 'category' : 'home'),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: LinearGradient(
                    colors: [nightIndigo, Color(0xFF3D3563)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(
                      color: nightIndigo.withOpacity(0.25),
                      blurRadius: 14,
                      offset: const Offset(0, 4))
                ],
              ),
              child: const Center(
                  child: Text('🌙', style: TextStyle(fontSize: 22))),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════ HOME CONTENT ═══════════
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        children: [
          // Hero card — Today's Recommendation
          _buildHeroCard(),
          const SizedBox(height: 14),
          // Five calm signals label
          _buildFeatureLabel('✦ Five calm signals ✦'),
          const SizedBox(height: 8),
          // Widget row — 2 cards
          _buildWidgetRow(),
          const SizedBox(height: 12),
          // Full-width parenting focus widget
          _buildFullWidget(),
          const SizedBox(height: 12),
          // Second widget row
          _buildSecondRow(),
          const SizedBox(height: 16),
          // Talk to Luna button
          _buildTalkToLunaButton(),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
            colors: [nightIndigo, Color(0xFF3D3563)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
              color: nightIndigo.withOpacity(0.25),
              blurRadius: 30,
              offset: const Offset(0, 12))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('✦ Today\'s Recommendation',
              style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: softLavender,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          const Text('Try 5 minutes of quiet presence after pickup today',
              style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 22,
                  color: bgWarm,
                  height: 1.3)),
          const SizedBox(height: 6),
          Text(
              'Your child\'s emotional tank is lower this week. A short transition ritual before any questions or requests may reduce evening overwhelm.',
              style: TextStyle(
                  fontSize: 13,
                  color: paleLilac.withOpacity(0.95),
                  height: 1.6)),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => setState(() => _screen = 'category'),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                  color: champagneGold,
                  borderRadius: BorderRadius.circular(999)),
              child: const Text('Talk to Luna about it →',
                  style: TextStyle(
                      fontSize: 12,
                      color: nightIndigo,
                      fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 30,
              height: 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                champagneGold.withOpacity(0.4)
              ]))),
          const SizedBox(width: 12),
          Text(text,
              style: const TextStyle(
                  fontSize: 10,
                  color: textSoft,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 12),
          Container(
              width: 30,
              height: 1,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                champagneGold.withOpacity(0.4),
                Colors.transparent
              ]))),
        ],
      ),
    );
  }

  Widget _buildWidgetRow() {
    return Row(
      children: [
        Expanded(
            child: _buildWidget(
          gradient: LinearGradient(
              colors: [lilacWash, bgWhite],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          cornerDeco: '🌙',
          label: 'Emotional State',
          title: 'Settled but tired',
          desc:
              'After a long week, energy is gentle. Hold space for slow mornings.',
        )),
        const SizedBox(width: 12),
        Expanded(
            child: _buildWidget(
          gradient: LinearGradient(
              colors: [warmCream, bgWhite],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          cornerDeco: '⚡',
          label: 'Energy / Readiness',
          title: 'Moderate',
          desc: 'A short walk or quiet activity may regulate well tonight.',
        )),
      ],
    );
  }

  Widget _buildWidget(
      {required Gradient gradient,
      required String cornerDeco,
      required String label,
      required String title,
      required String desc}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: gradient,
        boxShadow: [
          BoxShadow(
              color: lunaPurple.withOpacity(0.08),
              blurRadius: 28,
              offset: const Offset(0, 12)),
          BoxShadow(
              color: warmCream.withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
              top: -10,
              right: -10,
              child: Text(cornerDeco,
                  style: TextStyle(
                      fontSize: 24, color: softLavender.withOpacity(0.15)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(
                      fontSize: 9,
                      letterSpacing: 2,
                      color: textSoft,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              Text(title,
                  style: const TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 20,
                      color: textDeep,
                      height: 1.25)),
              const SizedBox(height: 6),
              Text(desc,
                  style: const TextStyle(
                      fontSize: 12, color: textMuted, height: 1.6)),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ask Luna about this',
                        style: TextStyle(
                            fontSize: 11,
                            color: lunaPurple,
                            fontWeight: FontWeight.w600)),
                    SizedBox(width: 4),
                    Text('→',
                        style: TextStyle(fontSize: 13, color: lunaPurple)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFullWidget() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
            colors: [lilacWash, bgWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
              color: lunaPurple.withOpacity(0.08),
              blurRadius: 28,
              offset: const Offset(0, 12)),
          BoxShadow(
              color: warmCream.withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
              top: -10,
              right: -10,
              child: Text('🌸',
                  style: TextStyle(
                      fontSize: 32, color: softLavender.withOpacity(0.15)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Parenting Focus',
                  style: TextStyle(
                      fontSize: 9,
                      letterSpacing: 2,
                      color: textSoft,
                      fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              const Text('Connection before correction',
                  style: TextStyle(
                      fontFamily: 'DM Serif Display',
                      fontSize: 20,
                      color: textDeep)),
              const SizedBox(height: 8),
              const Text(
                  'When your child resists transitions this week, try a few minutes of quiet presence first — a soft question about their day. Connection-first approaches are commonly used in emotion-coaching and whole-brain parenting frameworks.',
                  style:
                      TextStyle(fontSize: 12, color: textMuted, height: 1.6)),
              const SizedBox(height: 12),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: insightTint,
                    borderRadius: BorderRadius.circular(999)),
                child: const Text('Framework-informed',
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF6F84A0),
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5)),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ask Luna about this',
                        style: TextStyle(
                            fontSize: 11,
                            color: lunaPurple,
                            fontWeight: FontWeight.w600)),
                    SizedBox(width: 4),
                    Text('→',
                        style: TextStyle(fontSize: 13, color: lunaPurple)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecondRow() {
    return Row(
      children: [
        Expanded(
            child: _buildMiniWidget(
                'Connection Ritual', 'Sunset walk', '15 min · let them lead')),
        const SizedBox(width: 12),
        Expanded(
            child: _buildMiniWidget('Recent Pattern', 'Evening overwhelm',
                '3 instances this week')),
      ],
    );
  }

  Widget _buildMiniWidget(String label, String title, String desc) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: bgWhite,
        boxShadow: [
          BoxShadow(
              color: lunaPurple.withOpacity(0.08),
              blurRadius: 28,
              offset: const Offset(0, 12)),
          BoxShadow(
              color: warmCream.withOpacity(0.6),
              blurRadius: 8,
              offset: const Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 9,
                  letterSpacing: 2,
                  color: textSoft,
                  fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 16,
                  color: textDeep)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 12, color: textMuted)),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => setState(() => _screen = 'category'),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reflect with Luna',
                    style: TextStyle(
                        fontSize: 11,
                        color: lunaPurple,
                        fontWeight: FontWeight.w600)),
                SizedBox(width: 4),
                Text('→', style: TextStyle(fontSize: 13, color: lunaPurple)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTalkToLunaButton() {
    return GestureDetector(
      onTap: () => setState(() => _screen = 'category'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: LinearGradient(colors: [lunaPurple, softLavender]),
          boxShadow: [
            BoxShadow(
                color: lunaPurple.withOpacity(0.35),
                blurRadius: 24,
                offset: const Offset(0, 8))
          ],
        ),
        child: const Center(
          child: Text('✦ Talk to Luna',
              style: TextStyle(
                  fontSize: 14,
                  color: bgWarm,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5)),
        ),
      ),
    );
  }

  // ═══════════ CATEGORY SELECTOR ═══════════
  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Text('What kind of moment is this?',
              style: TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 28,
                  color: textDeep,
                  letterSpacing: 0.2)),
          const SizedBox(height: 6),
          const Text('Pick a mode — Luna will shape its guidance to fit.',
              style: TextStyle(fontSize: 13, color: textMuted, height: 1.6)),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemCount: _modes.length,
              itemBuilder: (_, i) => _buildCategoryCard(_modes[i]),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> mode) {
    return GestureDetector(
      onTap: () => _openChat(mode['key']),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [mode['tint'] as Color, bgWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.transparent, width: 1.5),
          boxShadow: [
            BoxShadow(
                color: lunaPurple.withOpacity(0.08),
                blurRadius: 24,
                offset: const Offset(0, 10)),
            BoxShadow(
                color: warmCream.withOpacity(0.4),
                blurRadius: 6,
                offset: const Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mode['emoji'] as String, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 8),
            Text(mode['name'] as String,
                style: const TextStyle(
                    fontFamily: 'DM Serif Display',
                    fontSize: 17,
                    color: textDeep)),
            const SizedBox(height: 4),
            Text(mode['desc'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 11, color: textMuted, height: 1.4)),
          ],
        ),
      ),
    );
  }

  // ═══════════ CHAT VIEW ═══════════
  Widget _buildChatView() {
    final mode = _getMode();
    return Column(
      children: [
        // Mode bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: lilacWash,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child:
                    const Icon(Icons.arrow_back, size: 18, color: lunaPurple),
              ),
              const SizedBox(width: 10),
              Text('${mode['emoji']} ${mode['name']} mode',
                  style: const TextStyle(
                      fontSize: 12,
                      color: lunaPurple,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        // Messages
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _buildMessageBubble(_messages[i]),
          ),
        ),
        // Chat actions row
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Row(
            children: [
              _buildChatActionButton('🎙'),
              const SizedBox(width: 8),
              _buildChatActionButton('📷'),
              const SizedBox(width: 8),
              _buildChatActionButton('📖'),
              const Spacer(),
              const Text('Save to: ',
                  style: TextStyle(fontSize: 10, color: textSoft)),
              const Text('Diary →',
                  style: TextStyle(
                      fontSize: 10,
                      color: lunaPurple,
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        // Input area
        Container(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 16),
          decoration: BoxDecoration(
            color: bgWarm,
            border: Border(top: BorderSide(color: lineFaint)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  style: const TextStyle(fontSize: 13, color: textDeep),
                  decoration: InputDecoration(
                    hintText: 'Share a moment with Luna...',
                    hintStyle: const TextStyle(color: textFaint),
                    filled: true,
                    fillColor: bgWhite,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 13),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: const BorderSide(color: lineSoft)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: const BorderSide(color: lineSoft)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(999),
                        borderSide: const BorderSide(color: softLavender)),
                  ),
                  onSubmitted: _sendMessage,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => _sendMessage(_messageController.text),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:
                        LinearGradient(colors: [lunaPurple, softLavender]),
                    boxShadow: [
                      BoxShadow(
                          color: lunaPurple.withOpacity(0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 6))
                    ],
                  ),
                  child:
                      const Icon(Icons.arrow_upward, color: bgWarm, size: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatActionButton(String emoji) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgWhite,
        border: Border.all(color: lineSoft),
      ),
      child: Center(child: Text(emoji, style: const TextStyle(fontSize: 16))),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> msg) {
    final isUser = msg['type'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 14),
        constraints: BoxConstraints(
            maxWidth:
                MediaQuery.of(context).size.width * (isUser ? 0.75 : 0.88)),
        decoration: BoxDecoration(
          borderRadius: isUser
              ? const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                  bottomLeft: Radius.circular(22),
                  bottomRight: Radius.circular(6))
              : const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                  bottomRight: Radius.circular(22),
                  bottomLeft: Radius.circular(6)),
          color: isUser ? nightIndigo : bgWhite,
          gradient: isUser
              ? LinearGradient(colors: [nightIndigo, Color(0xFF3D3563)])
              : LinearGradient(colors: [bgWhite, bgWhite]),
          boxShadow: isUser
              ? [
                  BoxShadow(
                      color: nightIndigo.withOpacity(0.2),
                      blurRadius: 16,
                      offset: const Offset(0, 4))
                ]
              : [
                  BoxShadow(
                      color: softLavender.withOpacity(0.12),
                      blurRadius: 24,
                      offset: const Offset(0, 8)),
                  BoxShadow(
                      color: warmCream.withOpacity(0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 2)),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser && msg['modeEmoji'] != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text('${msg['modeEmoji']} ',
                        style: const TextStyle(fontSize: 14)),
                    Text('${msg['modeName']} Mode',
                        style: const TextStyle(
                            fontSize: 10,
                            color: lunaPurple,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2)),
                  ],
                ),
              ),
            Text(
              msg['text'] as String,
              style: TextStyle(
                  fontSize: 13,
                  height: 1.65,
                  color: isUser ? bgWarm : textDeep),
            ),
            if (msg['hasFramework'] == true) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lilacWash,
                  borderRadius: BorderRadius.circular(10),
                  border: const Border(
                      left: BorderSide(color: lunaPurple, width: 2)),
                ),
                child: const Row(
                  children: [
                    Text('📚 ', style: TextStyle(fontSize: 12)),
                    Expanded(
                        child: Text('Why Luna suggests this',
                            style: TextStyle(
                                fontSize: 10,
                                color: lunaPurple,
                                fontWeight: FontWeight.w500))),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
