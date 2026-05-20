import 'package:flutter/material.dart';

/// LunaChat — Luna AI Parenting Companion
/// Home snapshot + mode selector + chat interface
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
  bool _onboardingDone = false;
  bool _onboardingDone = false;
  String _screen = 'home'; // 'onboarding', 'home', 'category', 'chat'
  String _chatMode = 'reflection';
  final _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final _scrollController = ScrollController();

  static const _modes = [
    {'emoji': '💛', 'name': 'Crisis', 'desc': 'Meltdown, overwhelm, conflict happening now', 'key': 'crisis', 'tint': crisisTint},
    {'emoji': '🌙', 'name': 'Reflection', 'desc': 'Debrief after the moment passed', 'key': 'reflection', 'tint': lilacWash},
    {'emoji': '✨', 'name': 'Milestone', 'desc': 'A breakthrough or growth moment', 'key': 'milestone', 'tint': warmCream},
    {'emoji': '🌸', 'name': 'Bonding', 'desc': 'Rituals, connection, core memories', 'key': 'bonding', 'tint': bondTint},
    {'emoji': '🌿', 'name': 'Wellness', 'desc': 'Sleep, food, energy, routines', 'key': 'wellness', 'tint': calmTint},
    {'emoji': '👁', 'name': 'Observation', 'desc': 'Pattern noticing, social changes', 'key': 'observation', 'tint': insightTint},
  ];

  void _onOnboardingComplete() {
    setState(() => _onboardingDone = true);
  }

  void _openChat(String modeKey) {
    final mode = _modes.firstWhere((m) => m['key'] == modeKey);
    setState(() {
      _screen = 'chat';
      _chatMode = modeKey;
      _messages.clear();
      _messages.add({
        'type': 'luna',
        'text': 'Hi. I noticed you wanted to reflect on something from today. Share what happened — I\'ll help you make sense of it, gently.',
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
        'text': 'Thank you for sharing. Let me reflect on that with you... 🌙\n\n✦ What happened — it sounds like this moment caught you off-guard.\n✦ Possible triggers — transitions and fatigue may have played a role.\n✦ What worked — staying calm and present helped.\n✦ What to try next time — a 3-minute quiet buffer before transitions.',
        'modeEmoji': _getMode()['emoji'],
        'modeName': _getMode()['name'],
        'hasFramework': true,
      });
    });
    _messageController.clear();
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
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

  // ── Onboarding ──
  int _onboardingStep = 1;
  Set<String> _selectedStyles = {};
  Set<String> _selectedTraits = {};
  Set<String> _selectedPriorities = {};
  String _parentRole = '';

  void _nextStep() {
    setState(() {
      if (_onboardingStep < 7) _onboardingStep++;
      else _onOnboardingComplete();
    });
  }

  Widget _buildOnboarding() {
    final pages = <Widget>[
      _buildWelcome(), _buildWhoParenting(), _buildChildProfile(),
      _buildParentingStyle(), _buildPriorities(), _buildHowLunaGuides(), _buildReady(),
    ];
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [bgWarm, warmCream, Color(0xFFF4EEF6)])),
      child: SafeArea(child: Column(children: [
        if (_onboardingStep < 7) Align(alignment: Alignment.topRight, child: TextButton(onPressed: _onOnboardingComplete, child: Text('Skip', style: TextStyle(color: textMuted, fontSize: 13)))),
        Expanded(child: pages[_onboardingStep - 1]),
        _buildOnboardingDots(),
        _buildOnboardingButton(),
        SizedBox(height: 20),
      ])),
    );
  }

  Widget _buildOnboardingDots() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(7, (i) => Container(margin: EdgeInsets.symmetric(horizontal: 4), width: i == _onboardingStep - 1 ? 10 : 6, height: i == _onboardingStep - 1 ? 10 : 6, decoration: BoxDecoration(shape: BoxShape.circle, color: i == _onboardingStep - 1 ? lunaPurple : softLavender.withOpacity(0.4))))));
  }

  Widget _buildOnboardingButton() {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: ElevatedButton(onPressed: _nextStep, style: ElevatedButton.styleFrom(backgroundColor: lunaPurple, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))), child: Text(_onboardingStep == 7 ? 'Begin Your Journey ✨' : 'Next →', style: TextStyle(fontSize: 15))));
  }

  Widget _buildWelcome() {
    return Center(child: Padding(padding: EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('🌙', style: TextStyle(fontSize: 64)), SizedBox(height: 20),
      Text('Welcome to Luna', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 30, color: nightIndigo)), SizedBox(height: 12),
      Text('A calm space to reflect, understand, and grow together with your child. No judgment. No pressure.', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: textMuted, height: 1.6)),
      SizedBox(height: 24),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: lilacWash, borderRadius: BorderRadius.circular(14)), child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.lock_outline, size: 16, color: lunaPurple), SizedBox(width: 8), Text('Private. Secure. Yours.', style: TextStyle(fontSize: 13, color: lunaPurple))])),
    ])));
  }

  Widget _buildWhoParenting() {
    return _onboardingPage('👋', "Who's parenting?", 'This helps Luna tailor language and context to you.', Column(children: ['Parent', 'Co-parent', 'Caregiver', 'Expecting parent'].map((r) => Padding(padding: EdgeInsets.only(bottom: 8), child: GestureDetector(onTap: () => setState(() => _parentRole = r), child: Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: _parentRole == r ? lunaPurple : Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: _parentRole == r ? lunaPurple : lineSoft)), child: Text(r, style: TextStyle(color: _parentRole == r ? Colors.white : textDeep, fontSize: 14)))))).toList())));
  }

  Widget _buildChildProfile() {
    final traits = ['Sensitive', 'Curious', 'Independent', 'Thoughtful', 'Energetic', 'Shy'];
    return _onboardingPage('✨', 'Tell me about your child', 'Age, personality, and what makes them unique.', Wrap(spacing: 8, children: traits.map((t) => GestureDetector(onTap: () => setState(() { if (_selectedTraits.contains(t)) _selectedTraits.remove(t); else _selectedTraits.add(t); }), child: Chip(label: Text(t, style: TextStyle(color: _selectedTraits.contains(t) ? Colors.white : textDeep, fontSize: 12)), backgroundColor: _selectedTraits.contains(t) ? lunaPurple : Colors.white, side: BorderSide(color: _selectedTraits.contains(t) ? lunaPurple : lineSoft)))).toList())));
  }

  Widget _buildParentingStyle() {
    final styles = ['Structured', 'Warm', 'Flexible', 'Growth-focused', 'Independence-building', 'Nurturing'];
    return _onboardingPage('🌱', 'Your parenting style', 'Luna will adapt its tone to match your values.', Wrap(spacing: 8, children: styles.map((s) => GestureDetector(onTap: () => setState(() { if (_selectedStyles.contains(s)) _selectedStyles.remove(s); else _selectedStyles.add(s); }), child: Chip(label: Text(s, style: TextStyle(color: _selectedStyles.contains(s) ? Colors.white : textDeep, fontSize: 12)), backgroundColor: _selectedStyles.contains(s) ? lunaPurple : Colors.white, side: BorderSide(color: _selectedStyles.contains(s) ? lunaPurple : lineSoft)))).toList())));
  }

  Widget _buildPriorities() {
    final priorities = ['Emotional regulation', 'Confidence', 'Friendships', 'Discipline', 'Nutrition', 'Learning'];
    return _onboardingPage('🎯', 'Your priorities right now', 'What matters most for your family this season?', Wrap(spacing: 8, children: priorities.map((p) => GestureDetector(onTap: () => setState(() { if (_selectedPriorities.contains(p)) _selectedPriorities.remove(p); else _selectedPriorities.add(p); }), child: Chip(label: Text(p, style: TextStyle(color: _selectedPriorities.contains(p) ? Colors.white : textDeep, fontSize: 12)), backgroundColor: _selectedPriorities.contains(p) ? lunaPurple : Colors.white, side: BorderSide(color: _selectedPriorities.contains(p) ? lunaPurple : lineSoft)))).toList())));
  }

  Widget _buildHowLunaGuides() {
    return _onboardingPage('🧭', 'How Luna guides you', '', Column(children: [
      _guideCard('✦', 'Personalized', 'Luna learns from your child profile and daily moments.'),
      _guideCard('📚', 'Framework-backed', 'Whole-Brain Child, Emotion Coaching, CASEL, IB, and more.'),
      _guideCard('🔒', 'Private', 'Your family data stays encrypted. You control everything.'),
    ]));
  }

  Widget _guideCard(String icon, String title, String desc) {
    return Card(elevation: 0, color: Colors.white, margin: EdgeInsets.only(bottom: 10), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), child: Padding(padding: EdgeInsets.all(14), child: Row(children: [Text(icon, style: TextStyle(fontSize: 22)), SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: nightIndigo)), SizedBox(height: 2), Text(desc, style: TextStyle(fontSize: 12, color: textMuted))]))])));
  }

  Widget _buildReady() {
    return _onboardingPage('💫', "You're ready", 'Luna will grow with your family — learning patterns, remembering moments, and helping you parent with intention.', Column(children: [Text('"Growing together. Intentionally."', textAlign: TextAlign.center, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16, color: champagneGold))]));
  }

  Widget _onboardingPage(String emoji, String title, String subtitle, Widget body) {
    return SingleChildScrollView(padding: EdgeInsets.all(24), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [SizedBox(height: 20), Text(emoji, style: TextStyle(fontSize: 48)), SizedBox(height: 20), Text(title, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 26, color: nightIndigo)), SizedBox(height: 8), if (subtitle.isNotEmpty) Padding(padding: EdgeInsets.only(bottom: 24), child: Text(subtitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 14, color: textMuted))), body]));
  }

  @override
  Widget build(BuildContext context) {
    if (!_onboardingDone) return _buildOnboarding();
    return Container(
      color: bgWarm,
      child: Column(
        children: [
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



  // ═══════════ HOME CONTENT ═══════════
  Widget _buildHomeContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: Column(
        children: [
          // Hero card — Today's Recommendation
          _buildHeroCard(),
          SizedBox(height: 14),
          // Five calm signals label
          _buildFeatureLabel('✦ Five calm signals ✦'),
          SizedBox(height: 8),
          // Widget row — 2 cards
          _buildWidgetRow(),
          SizedBox(height: 12),
          // Full-width parenting focus widget
          _buildFullWidget(),
          SizedBox(height: 12),
          // Second widget row
          _buildSecondRow(),
          SizedBox(height: 16),
          // Talk to Luna button
          _buildTalkToLunaButton(),
        ],
      ),
    );
  }

  Widget _buildHeroCard() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(colors: [nightIndigo, Color(0xFF3D3563)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [BoxShadow(color: nightIndigo.withOpacity(0.25), blurRadius: 30, offset: Offset(0, 12))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('✦ Today\'s Recommendation', style: TextStyle(fontSize: 10, letterSpacing: 2, color: softLavender, fontWeight: FontWeight.w600)),
          SizedBox(height: 8),
          Text('Try 5 minutes of quiet presence after pickup today', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 22, color: bgWarm, height: 1.3)),
          SizedBox(height: 6),
          Text('Your child\'s emotional tank is lower this week. A short transition ritual before any questions or requests may reduce evening overwhelm.', style: TextStyle(fontSize: 13, color: paleLilac.withOpacity(0.95), height: 1.6)),
          SizedBox(height: 14),
          GestureDetector(
            onTap: () => setState(() => _screen = 'category'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(color: champagneGold, borderRadius: BorderRadius.circular(999)),
              child: Text('Talk to Luna about it →', style: TextStyle(fontSize: 12, color: nightIndigo, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureLabel(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 30, height: 1, decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, champagneGold.withOpacity(0.4)]))),
          SizedBox(width: 12),
          Text(text, style: TextStyle(fontSize: 10, color: textSoft, letterSpacing: 2.5, fontWeight: FontWeight.w500)),
          SizedBox(width: 12),
          Container(width: 30, height: 1, decoration: BoxDecoration(gradient: LinearGradient(colors: [champagneGold.withOpacity(0.4), Colors.transparent]))),
        ],
      ),
    );
  }

  Widget _buildWidgetRow() {
    return Row(
      children: [
        Expanded(child: _buildWidget(
          gradient: LinearGradient(colors: [lilacWash, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
          cornerDeco: '🌙',
          label: 'Emotional State',
          title: 'Settled but tired',
          desc: 'After a long week, energy is gentle. Hold space for slow mornings.',
        )),
        SizedBox(width: 12),
        Expanded(child: _buildWidget(
          gradient: LinearGradient(colors: [warmCream, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
          cornerDeco: '⚡',
          label: 'Energy / Readiness',
          title: 'Moderate',
          desc: 'A short walk or quiet activity may regulate well tonight.',
        )),
      ],
    );
  }

  Widget _buildWidget({required Gradient gradient, required String cornerDeco, required String label, required String title, required String desc}) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: gradient,
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.08), blurRadius: 28, offset: Offset(0, 12)),
          BoxShadow(color: warmCream.withOpacity(0.6), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(top: -10, right: -10, child: Text(cornerDeco, style: TextStyle(fontSize: 24, color: softLavender.withOpacity(0.15)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 9, letterSpacing: 2, color: textSoft, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Text(title, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 20, color: textDeep, height: 1.25)),
              SizedBox(height: 6),
              Text(desc, style: TextStyle(fontSize: 12, color: textMuted, height: 1.6)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ask Luna about this', style: TextStyle(fontSize: 11, color: lunaPurple, fontWeight: FontWeight.w600)),
                    SizedBox(width: 4),
                    Text('→', style: TextStyle(fontSize: 13, color: lunaPurple)),
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
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(colors: [lilacWash, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.08), blurRadius: 28, offset: Offset(0, 12)),
          BoxShadow(color: warmCream.withOpacity(0.6), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(top: -10, right: -10, child: Text('🌸', style: TextStyle(fontSize: 32, color: softLavender.withOpacity(0.15)))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Parenting Focus', style: TextStyle(fontSize: 9, letterSpacing: 2, color: textSoft, fontWeight: FontWeight.w500)),
              SizedBox(height: 8),
              Text('Connection before correction', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 20, color: textDeep)),
              SizedBox(height: 8),
              Text('When your child resists transitions this week, try a few minutes of quiet presence first — a soft question about their day. Connection-first approaches are commonly used in emotion-coaching and whole-brain parenting frameworks.', style: TextStyle(fontSize: 12, color: textMuted, height: 1.6)),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(color: insightTint, borderRadius: BorderRadius.circular(999)),
                child: Text('Framework-informed', style: TextStyle(fontSize: 10, color: Color(0xFF6F84A0), fontWeight: FontWeight.w600, letterSpacing: 0.5)),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ask Luna about this', style: TextStyle(fontSize: 11, color: lunaPurple, fontWeight: FontWeight.w600)),
                    SizedBox(width: 4),
                    Text('→', style: TextStyle(fontSize: 13, color: lunaPurple)),
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
        Expanded(child: _buildMiniWidget('Connection Ritual', 'Sunset walk', '15 min · let them lead')),
        SizedBox(width: 12),
        Expanded(child: _buildMiniWidget('Recent Pattern', 'Evening overwhelm', '3 instances this week')),
      ],
    );
  }

  Widget _buildMiniWidget(String label, String title, String desc) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: bgWhite,
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.08), blurRadius: 28, offset: Offset(0, 12)),
          BoxShadow(color: warmCream.withOpacity(0.6), blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 9, letterSpacing: 2, color: textSoft, fontWeight: FontWeight.w500)),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 16, color: textDeep)),
          SizedBox(height: 4),
          Text(desc, style: TextStyle(fontSize: 12, color: textMuted)),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => setState(() => _screen = 'category'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Reflect with Luna', style: TextStyle(fontSize: 11, color: lunaPurple, fontWeight: FontWeight.w600)),
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
        padding: EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(999),
          gradient: LinearGradient(colors: [lunaPurple, softLavender]),
          boxShadow: [BoxShadow(color: lunaPurple.withOpacity(0.35), blurRadius: 24, offset: Offset(0, 8))],
        ),
        child: Center(
          child: Text('✦ Talk to Luna', style: TextStyle(fontSize: 14, color: bgWarm, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        ),
      ),
    );
  }

  // ═══════════ CATEGORY SELECTOR ═══════════
  Widget _buildCategorySelector() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          Text('What kind of moment is this?', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 28, color: textDeep, letterSpacing: 0.2)),
          SizedBox(height: 6),
          Text('Pick a mode — Luna will shape its guidance to fit.', style: TextStyle(fontSize: 13, color: textMuted, height: 1.6)),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.05,
              ),
              itemCount: _modes.length,
              itemBuilder: (_, i) => _buildCategoryCard(_modes[i]),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> mode) {
    return GestureDetector(
      onTap: () => _openChat(mode['key']),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(
            colors: [mode['tint'] as Color, bgWhite],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.transparent, width: 1.5),
          boxShadow: [
            BoxShadow(color: lunaPurple.withOpacity(0.08), blurRadius: 24, offset: Offset(0, 10)),
            BoxShadow(color: warmCream.withOpacity(0.4), blurRadius: 6, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mode['emoji'] as String, style: TextStyle(fontSize: 28)),
            SizedBox(height: 8),
            Text(mode['name'] as String, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 17, color: textDeep)),
            SizedBox(height: 4),
            Text(mode['desc'] as String, textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: textMuted, height: 1.4)),
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
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: lilacWash,
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() => _screen = 'category'),
                child: Icon(Icons.arrow_back, size: 18, color: lunaPurple),
              ),
              SizedBox(width: 10),
              Text('${mode['emoji']} ${mode['name']} mode', style: TextStyle(fontSize: 12, color: lunaPurple, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        // Messages
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.all(16),
            itemCount: _messages.length,
            itemBuilder: (_, i) => _buildMessageBubble(_messages[i]),
          ),
        ),
        // Chat actions row
        Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
          child: Row(
            children: [
              _buildChatActionButton('🎙'),
              SizedBox(width: 8),
              _buildChatActionButton('📷'),
              SizedBox(width: 8),
              _buildChatActionButton('📖'),
              Spacer(),
              Text('Save to: ', style: TextStyle(fontSize: 10, color: textSoft)),
              Text('Diary →', style: TextStyle(fontSize: 10, color: lunaPurple, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        // Input area
        Container(
          padding: EdgeInsets.fromLTRB(20, 14, 20, 16),
          decoration: BoxDecoration(
            color: bgWarm,
            border: Border(top: BorderSide(color: lineFaint)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _messageController,
                  style: TextStyle(fontSize: 13, color: textDeep),
                  decoration: InputDecoration(
                    hintText: 'Share a moment with Luna...',
                    hintStyle: TextStyle(color: textFaint),
                    filled: true,
                    fillColor: bgWhite,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide(color: lineSoft)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide(color: lineSoft)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(999), borderSide: BorderSide(color: softLavender)),
                  ),
                  onSubmitted: _sendMessage,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () => _sendMessage(_messageController.text),
                child: Container(
                  width: 44, height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [lunaPurple, softLavender]),
                    boxShadow: [BoxShadow(color: lunaPurple.withOpacity(0.35), blurRadius: 20, offset: Offset(0, 6))],
                  ),
                  child: Icon(Icons.arrow_upward, color: bgWarm, size: 20),
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
      width: 36, height: 36,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgWhite,
        border: Border.all(color: lineSoft),
      ),
      child: Center(child: Text(emoji, style: TextStyle(fontSize: 16))),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> msg) {
    final isUser = msg['type'] == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        padding: EdgeInsets.fromLTRB(18, 14, 18, 14),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * (isUser ? 0.75 : 0.88)),
        decoration: BoxDecoration(
          borderRadius: isUser
              ? BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22), bottomLeft: Radius.circular(22), bottomRight: Radius.circular(6))
              : BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22), bottomRight: Radius.circular(22), bottomLeft: Radius.circular(6)),
          color: isUser ? nightIndigo : bgWhite,
          gradient: isUser ? LinearGradient(colors: [nightIndigo, Color(0xFF3D3563)]) : LinearGradient(colors: [bgWhite, bgWhite]),
          boxShadow: isUser
              ? [BoxShadow(color: nightIndigo.withOpacity(0.2), blurRadius: 16, offset: Offset(0, 4))]
              : [
                  BoxShadow(color: softLavender.withOpacity(0.12), blurRadius: 24, offset: Offset(0, 8)),
                  BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isUser && msg['modeEmoji'] != null)
              Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text('${msg['modeEmoji']} ', style: TextStyle(fontSize: 14)),
                    Text('${msg['modeName']} Mode', style: TextStyle(fontSize: 10, color: lunaPurple, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
                  ],
                ),
              ),
            Text(
              msg['text'] as String,
              style: TextStyle(fontSize: 13, height: 1.65, color: isUser ? bgWarm : textDeep),
            ),
            if (msg['hasFramework'] == true) ...[
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: lilacWash,
                  borderRadius: BorderRadius.circular(10),
                  border: Border(left: BorderSide(color: lunaPurple, width: 2)),
                ),
                child: Row(
                  children: [
                    Text('📚 ', style: TextStyle(fontSize: 12)),
                    Expanded(child: Text('Why Luna suggests this', style: TextStyle(fontSize: 10, color: lunaPurple, fontWeight: FontWeight.w500))),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // ═══════════ BOTTOM NAV ═══════════}
