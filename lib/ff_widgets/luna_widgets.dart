/// All Luna custom widgets for FlutterFlow
/// Just drag these onto any page
import 'package:flutter/material.dart';

// ── Splash Screen ──
class LunaSplash extends StatelessWidget {
  const LunaSplash({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2B2447),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('🌙', style: TextStyle(fontSize: 48)),
            SizedBox(height: 20),
            Text('Luna', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
            SizedBox(height: 12),
            Text('Your AI Parenting Companion', style: TextStyle(fontSize: 14, color: Color(0xFFB9A7D9))),
          ],
        ),
      ),
    );
  }
}

// ── Onboarding Screen ──
class LunaOnboarding extends StatefulWidget {
  const LunaOnboarding({super.key});
  @override
  State<LunaOnboarding> createState() => _LunaOnboardingState();
}

class _LunaOnboardingState extends State<LunaOnboarding> {
  int _page = 0;
  final _pages = [
    {'title': 'Welcome to Luna', 'body': 'Your AI companion for the parenting journey.'},
    {'title': 'How Luna Guides You', 'body': 'Personalized · Framework-Backed · Private'},
    {'title': 'You\'re Ready', 'body': 'Start your journey today.'},
  ];
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7EAD6),
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_pages[_page]['title']!, style: TextStyle(fontSize: 28, color: Color(0xFF2B2447), fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(_pages[_page]['body']!, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Color(0xFF6B5FA6))),
          SizedBox(height: 40),
          _page < 2
            ? ElevatedButton(onPressed: () => setState(() => _page++), child: Text('Next'))
            : ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF6B5FA6)), child: Text('Get Started', style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}

// ── Chat Screen ──
class LunaChat extends StatefulWidget {
  const LunaChat({super.key});
  @override
  State<LunaChat> createState() => _LunaChatState();
}

class _LunaChatState extends State<LunaChat> {
  final _messages = [{'text': 'Hi! 👋 I\'m Luna. How can I support you today?', 'isUser': false}];
  final _controller = TextEditingController();
  final _modes = ['Crisis', 'Reflection', 'Milestone', 'Bonding', 'Wellness', 'Observation'];

  void _send(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      _messages.add({'text': text, 'isUser': true});
      _messages.add({'text': 'Thank you for sharing. Let me reflect on that with you... 🌙', 'isUser': false});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF7EAD6),
      child: Column(
        children: [
          // Mode chips
          Container(
            height: 50,
            color: Colors.white,
            child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10), children: _modes.map((m) => Padding(padding: EdgeInsets.only(right: 8), child: ActionChip(label: Text(m, style: TextStyle(fontSize: 12)), onPressed: () {}))).toList()),
          ),
          // Messages
          Expanded(
            child: ListView.builder(padding: EdgeInsets.all(16), itemCount: _messages.length, itemBuilder: (_, i) {
              final msg = _messages[i];
              return Align(
                alignment: msg['isUser'] == true ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(maxWidth: 280),
                  decoration: BoxDecoration(
                    color: msg['isUser'] == true ? Color(0xFF6B5FA6) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(msg['text']!, style: TextStyle(fontSize: 14, color: msg['isUser'] == true ? Colors.white : Color(0xFF2B2447))),
                ),
              );
            }),
          ),
          // Input bar
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Row(children: [
              IconButton(icon: Icon(Icons.mic), onPressed: () {}),
              Expanded(child: TextField(controller: _controller, decoration: InputDecoration(hintText: 'Share your thoughts...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(24))), onSubmitted: _send)),
              IconButton(icon: Icon(Icons.camera_alt), onPressed: () {}),
              IconButton(icon: Icon(Icons.send, color: Color(0xFF6B5FA6)), onPressed: () => _send(_controller.text)),
            ]),
          ),
        ],
      ),
    );
  }
}

// ── Diary Screen ──
class LunaDiary extends StatelessWidget {
  const LunaDiary({super.key});
  @override
  Widget build(BuildContext context) {
    final entries = [
      {'date': 'Today', 'title': 'Morning reflection', 'mood': '🤗', 'mode': 'Reflection'},
      {'date': 'Yesterday', 'title': 'Bedtime win', 'mood': '😌', 'mode': 'Milestone'},
      {'date': 'May 15', 'title': 'Tough afternoon', 'mood': '😔', 'mode': 'Crisis'},
    ];
    return Container(color: Color(0xFFF7EAD6), padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Your Diary', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
      SizedBox(height: 16),
      // This week card
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
        Text('📝', style: TextStyle(fontSize: 32)), SizedBox(width: 12),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('This Week', style: TextStyle(fontWeight: FontWeight.bold)), Text('3 entries · Streak: 4 days', style: TextStyle(color: Color(0xFF6B5FA6), fontSize: 13))])
      ])),
      SizedBox(height: 20),
      ...entries.map((e) => Card(margin: EdgeInsets.only(bottom: 12), child: ListTile(leading: Text(e['mood']!, style: TextStyle(fontSize: 24)), title: Text(e['title']!), subtitle: Text('${e['date']} · ${e['mode']}'))))
    ]));
  }
}

// ── Growth Screen ──
class LunaGrowth extends StatelessWidget {
  const LunaGrowth({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xFFF7EAD6), padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Growth', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
      SizedBox(height: 16),
      Row(children: [
        _metricCard('Weight', '18.5 kg', '75th %ile', '👁', Color(0xFF6B5FA6)),
        SizedBox(width: 12),
        _metricCard('Height', '112 cm', '80th %ile', '📝', Color(0xFFD8B67A)),
      ]),
      SizedBox(height: 20),
      Text('Milestones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
      SizedBox(height: 8),
      _milestoneTile('First words', true), _milestoneTile('Walking independently', true), _milestoneTile('Counting to 10', false),
    ]));
  }

  Widget _metricCard(String label, String value, String pct, String source, Color color) {
    return Expanded(child: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 12, color: Color(0xFF6B5FA6))), SizedBox(height: 4),
      Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text(pct, style: TextStyle(fontSize: 13, color: color)), SizedBox(height: 4),
      Text('$source Luna observation', style: TextStyle(fontSize: 10, color: Colors.grey)),
    ])));
  }

  Widget _milestoneTile(String name, bool achieved) {
    return ListTile(leading: Icon(achieved ? Icons.check_circle : Icons.circle_outlined, color: achieved ? Color(0xFFD8B67A) : Colors.grey), title: Text(name));
  }
}

// ── Nutrition Screen ──
class LunaNutrition extends StatelessWidget {
  const LunaNutrition({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xFFF7EAD6), padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Nutrition', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
      SizedBox(height: 16),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Color(0xFF6B5FA6), borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Activity Today', style: TextStyle(fontSize: 14, color: Color(0xFFB9A7D9))),
        SizedBox(height: 4),
        Text('Medium · ~1,400 kcal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
      ])),
      SizedBox(height: 16),
      Text('Today\'s Meals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      _mealCard('🥣', 'Breakfast', 'Oatmeal + banana', '320 kcal'),
      _mealCard('🍱', 'Lunch', 'Rice + chicken + veggies', '520 kcal'),
      _mealCard('🍎', 'Snack', 'Apple + yogurt', '180 kcal'),
    ]));
  }

  Widget _mealCard(String emoji, String meal, String food, String kcal) {
    return Card(child: ListTile(leading: Text(emoji, style: TextStyle(fontSize: 24)), title: Text('$meal: $food'), subtitle: Text(kcal)));
  }
}

// ── Profile Screen ──
class LunaProfile extends StatelessWidget {
  const LunaProfile({super.key});
  final _frameworks = ['Whole-Brain Child', 'Emotion Coaching', 'No-Drama Discipline', 'Gardener Philosophy', 'CASEL/SEL', 'IB Learner Profile', 'Polyvagal-informed', 'Ellyn Satter', 'Orchid & Dandelion', 'Visible Learning'];
  @override
  Widget build(BuildContext context) {
    return Container(color: Color(0xFFF7EAD6), padding: EdgeInsets.all(20), child: SingleChildScrollView(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
      SizedBox(height: 16),
      ListTile(leading: CircleAvatar(backgroundColor: Color(0xFF6B5FA6), child: Text('R', style: TextStyle(color: Colors.white))), title: Text('Your Profile'), subtitle: Text('Parent · Joined May 2026')),
      SizedBox(height: 20),
      Text('Active Frameworks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Wrap(spacing: 6, runSpacing: 6, children: _frameworks.map((f) => Chip(label: Text(f, style: TextStyle(fontSize: 11)), backgroundColor: Color(0xFFB9A7D9).withOpacity(0.2))).toList()),
      SizedBox(height: 20),
      Text('AI Memory Controls', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(height: 8),
      Wrap(spacing: 6, children: ['Edit', 'Forget', 'Consent', 'Co-Parent', 'Export', 'Delete'].map((a) => ActionChip(label: Text(a), onPressed: () {})).toList()),
    ])));
  }
}
