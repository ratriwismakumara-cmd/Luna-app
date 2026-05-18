/// Luna Complete App — All 5 tabs with real content
import 'package:flutter/material.dart';

class LunaApp extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaApp({super.key, this.width, this.height});
  @override
  State<LunaApp> createState() => _LunaAppState();
}

class _LunaAppState extends State<LunaApp> {
  int _index = 2;

  static const _tabs = [
    {'icon': Icons.book_outlined, 'label': 'Diary'},
    {'icon': Icons.trending_up, 'label': 'Growth'},
    {'icon': Icons.auto_awesome, 'label': 'Luna'},
    {'icon': Icons.restaurant, 'label': 'Nutrition'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  final _colors = {
    'purple': Color(0xFF2B2447),
    'lavender': Color(0xFF6B5FA6),
    'soft': Color(0xFFB9A7D9),
    'gold': Color(0xFFD8B67A),
    'cream': Color(0xFFF7EAD6),
  };

  // ── DIARY ──
  Widget _buildDiary() {
    final entries = [
      {'date': 'Today · 9:30 AM', 'title': 'Morning snuggles breakthrough', 'mood': '🤗', 'mode': 'Bonding', 'preview': 'Khaila asked me to stay for 5 more minutes this morning. Instead of rushing, I sat down...'},
      {'date': 'Yesterday · 8:15 PM', 'title': 'Bedtime without tears', 'mood': '😌', 'mode': 'Milestone', 'preview': 'First night in two weeks without a bedtime meltdown. The new wind-down routine with...'},
      {'date': 'May 16 · 3:40 PM', 'title': 'Tough afternoon meltdown', 'mood': '😔', 'mode': 'Crisis', 'preview': 'After school, Khaila completely broke down over homework. I remembered what Luna said...'},
    ];
    return Container(color: _colors['cream'], child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Your Diary', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 4),
      Text('A record of your parenting journey', style: TextStyle(fontSize: 14, color: _colors['lavender'])),
      SizedBox(height: 20),
      // Weekly summary card
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [_colors['purple']!, _colors['lavender']!]), borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('This Week', style: TextStyle(fontSize: 14, color: _colors['soft'])),
            SizedBox(height: 4),
            Text('5 entries', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            Text('4-day streak 🔥', style: TextStyle(fontSize: 14, color: _colors['soft'])),
          ]),
          Spacer(),
          Icon(Icons.auto_stories, size: 48, color: _colors['gold']),
        ]),
      ),
      SizedBox(height: 20),
      // Mood summary
      Text('Recent Entries', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 12),
      ...entries.map((e) => Card(
        margin: EdgeInsets.only(bottom: 12),
        elevation: 0, color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(padding: EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Text(e['mood']!, style: TextStyle(fontSize: 20)), SizedBox(width: 8),
            Text(e['title']!, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: _colors['purple'])),
          ]),
          SizedBox(height: 6),
          Text(e['preview']!, style: TextStyle(fontSize: 13, color: Colors.grey[600]), maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(height: 8),
          Row(children: [
            Chip(label: Text(e['mode']!, style: TextStyle(fontSize: 11)), backgroundColor: _colors['soft']!.withOpacity(0.2), padding: EdgeInsets.zero, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
            Spacer(),
            Text(e['date']!, style: TextStyle(fontSize: 11, color: Colors.grey)),
          ]),
        ])),
      )),
    ])));
  }

  // ── GROWTH ──
  Widget _buildGrowth() {
    return Container(color: _colors['cream'], child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Growth', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 4),
      Text('Track every milestone, big and small', style: TextStyle(fontSize: 14, color: _colors['lavender'])),
      SizedBox(height: 20),
      // Stats cards
      Row(children: [
        _metricCard('Weight', '18.5 kg', '75th %ile', '👁 Luna observation', _colors['purple']!),
        SizedBox(width: 12),
        _metricCard('Height', '112 cm', '80th %ile', '📝 Parent log', _colors['gold']!),
      ]),
      SizedBox(height: 12),
      Row(children: [
        _metricCard('Language', '1200+ words', 'Above avg', '📊 Assessment', _colors['lavender']!),
        SizedBox(width: 12),
        _metricCard('Social', 'Cooperative', 'On track', '🏫 School report', _colors['soft']!),
      ]),
      SizedBox(height: 24),
      // Milestones
      Text('Milestones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 12),
      _milestoneTile('Walking independently', true, '12 months'),
      _milestoneTile('First full sentence', true, '22 months'),
      _milestoneTile('Counting to 10', true, '36 months'),
      _milestoneTile('Reading simple words', false, 'Expected 48 months'),
      _milestoneTile('Tying shoelaces', false, 'Expected 60 months'),
      SizedBox(height: 20),
      // Assessment vault
      Text('Assessment Vault', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 8),
      Card(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: ListTile(leading: Icon(Icons.description, color: _colors['lavender']), title: Text('School Report — Year 3'), subtitle: Text('Uploaded May 2026'), trailing: Icon(Icons.download)))),
      Card(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: ListTile(leading: Icon(Icons.psychology, color: _colors['gold']), title: Text('Speech Assessment'), subtitle: Text('Uploaded Mar 2026'), trailing: Icon(Icons.download)))),
    ])));
  }

  Widget _metricCard(String label, String value, String sub, String source, Color accent) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          SizedBox(height: 4),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: _colors['purple'])),
          SizedBox(height: 2),
          Text(sub, style: TextStyle(fontSize: 12, color: accent, fontWeight: FontWeight.w600)),
          SizedBox(height: 6),
          Text(source, style: TextStyle(fontSize: 10, color: Colors.grey)),
        ]),
      ),
    );
  }

  Widget _milestoneTile(String name, bool achieved, String note) {
    return Card(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), margin: EdgeInsets.only(bottom: 8), child: ListTile(
      leading: Icon(achieved ? Icons.check_circle : Icons.circle_outlined, color: achieved ? _colors['gold'] : Colors.grey[400], size: 28),
      title: Text(name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      subtitle: Text(note, style: TextStyle(fontSize: 11, color: Colors.grey)),
    ));
  }

  // ── CHAT ──
  Widget _buildChat() {
    return Container(
      color: _colors['cream'],
      child: Column(children: [
        Container(width: double.infinity, padding: EdgeInsets.all(16),
          child: Row(children: [
            CircleAvatar(backgroundColor: _colors['lavender'], child: Text('🌙', style: TextStyle(fontSize: 20))),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Luna', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colors['purple'])),
              Text('Online · Your AI companion', style: TextStyle(fontSize: 12, color: _colors['lavender'])),
            ]),
          ]),
        ),
        Container(height: 48, color: Colors.white, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), children: ['Crisis', 'Reflection', 'Milestone', 'Bonding', 'Wellness', 'Observation'].map((m) => Padding(padding: EdgeInsets.only(right: 8), child: ActionChip(label: Text(m, style: TextStyle(fontSize: 11)), backgroundColor: _colors['soft']!.withOpacity(0.15), side: BorderSide.none, onPressed: () {}))).toList())),
        Expanded(child: Center(child: Padding(padding: EdgeInsets.all(32), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('🌙', style: TextStyle(fontSize: 56)),
          SizedBox(height: 20),
          Text('Hi! I\'m Luna.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: _colors['purple'])),
          SizedBox(height: 8),
          Text('How can I support you today?', style: TextStyle(fontSize: 16, color: _colors['lavender'], textAlign: TextAlign.center)),
          SizedBox(height: 24),
          Text('Try starting with a category above, or just share what\'s on your mind.', style: TextStyle(fontSize: 13, color: Colors.grey, textAlign: TextAlign.center)),
        ])))),
        Container(color: Colors.white, padding: EdgeInsets.all(12), child: Row(children: [
          IconButton(icon: Icon(Icons.mic, color: _colors['lavender']), onPressed: () {}),
          Expanded(child: TextField(decoration: InputDecoration(hintText: 'Share your thoughts...', hintStyle: TextStyle(fontSize: 14), border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), fillColor: _colors['cream'], filled: true, contentPadding: EdgeInsets.symmetric(horizontal: 16)))) ,
          SizedBox(width: 6),
          IconButton(icon: Icon(Icons.camera_alt, color: _colors['lavender']), onPressed: () {}),
          CircleAvatar(backgroundColor: _colors['purple'], radius: 20, child: Icon(Icons.send, color: Colors.white, size: 16)),
        ])),
      ]),
    );
  }

  // ── NUTRITION ──
  Widget _buildNutrition() {
    return Container(color: _colors['cream'], child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Nutrition', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 4),
      Text('Fuel for growing bodies and minds', style: TextStyle(fontSize: 14, color: _colors['lavender'])),
      SizedBox(height: 20),
      // Activity context
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [_colors['lavender']!, _colors['purple']!]), borderRadius: BorderRadius.circular(20)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Activity Today', style: TextStyle(fontSize: 13, color: _colors['soft'])),
          SizedBox(height: 4),
          Row(children: [
            Text('Medium', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
            Spacer(),
            Text('~1,400 kcal', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: _colors['gold'])),
          ]),
          SizedBox(height: 4),
          Text('Swimming + school PE', style: TextStyle(fontSize: 13, color: _colors['soft'])),
        ]),
      ),
      SizedBox(height: 24),
      Text('Today\'s Meals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 12),
      _mealCard('🥣', 'Breakfast', 'Oatmeal with banana & honey', '320 kcal', '8:00 AM'),
      _mealCard('🍱', 'Lunch', 'Rice, grilled chicken, steamed vegetables', '520 kcal', '12:30 PM'),
      _mealCard('🍎', 'Afternoon Snack', 'Apple slices with yogurt dip', '180 kcal', '3:30 PM'),
      _mealCard('🍲', 'Dinner', 'Chicken soup with carrots & potato', '380 kcal', '6:45 PM'),
      SizedBox(height: 20),
      Text('Water Intake', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: _colors['purple'])),
      SizedBox(height: 8),
      Row(children: [
        ...List.generate(6, (i) => Expanded(child: Padding(padding: EdgeInsets.only(right: 6), child: Container(height: 8, decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: i < 4 ? _colors['lavender'] : Colors.grey[300]))))),
        Text('  4/6', style: TextStyle(fontSize: 12, color: Colors.grey)),
      ]),
    ])));
  }

  Widget _mealCard(String emoji, String meal, String food, String kcal, String time) {
    return Card(elevation: 0, color: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), margin: EdgeInsets.only(bottom: 10), child: Padding(padding: EdgeInsets.all(14), child: Row(children: [
      Text(emoji, style: TextStyle(fontSize: 28)), SizedBox(width: 14),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(meal, style: TextStyle(fontSize: 11, color: _colors['lavender'], fontWeight: FontWeight.w600)),
        SizedBox(height: 2),
        Text(food, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: _colors['purple'])),
      ])),
      Column(children: [
        Text(kcal, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: _colors['lavender'])),
        Text(time, style: TextStyle(fontSize: 10, color: Colors.grey)),
      ]),
    ])));
  }

  // ── PROFILE ──
  Widget _buildProfile() {
    final frameworks = ['Whole-Brain Child', 'Emotion Coaching', 'No-Drama Discipline', 'Gardener Philosophy', 'CASEL/SEL', 'IB Learner Profile', 'Polyvagal-informed', 'Ellyn Satter', 'Orchid & Dandelion', 'Visible Learning'];
    return Container(color: _colors['cream'], child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Profile & Settings', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 20),
      // User card
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
        CircleAvatar(radius: 30, backgroundColor: _colors['lavender'], child: Text('R', style: TextStyle(fontSize: 24, color: Colors.white))),
        SizedBox(width: 14),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Parent Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _colors['purple'])), Text('Joined May 2026', style: TextStyle(fontSize: 12, color: Colors.grey)), Text('1 child · Khaila, 8yo', style: TextStyle(fontSize: 12, color: _colors['lavender']))]),
      ])),
      SizedBox(height: 20),
      Text('Active Frameworks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 10),
      Wrap(spacing: 6, runSpacing: 6, children: frameworks.map((f) => Chip(label: Text(f, style: TextStyle(fontSize: 11)), backgroundColor: _colors['soft']!.withOpacity(0.15), side: BorderSide.none, padding: EdgeInsets.symmetric(horizontal: 4))).toList()),
      SizedBox(height: 20),
      Text('AI Memory Controls', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: _colors['purple'])),
      SizedBox(height: 10),
      Wrap(spacing: 8, children: [
        _memoryChip('Edit Memory', Icons.edit), _memoryChip('Forget Topic', Icons.delete_outline),
        _memoryChip('Consent', Icons.shield_outlined), _memoryChip('Co-Parent', Icons.people_outline),
        _memoryChip('Export Data', Icons.download), _memoryChip('Delete Account', Icons.warning_amber),
      ]),
      SizedBox(height: 20),
      Container(padding: EdgeInsets.all(14), decoration: BoxDecoration(color: _colors['soft']!.withOpacity(0.15), borderRadius: BorderRadius.circular(12)), child: Row(children: [
        Icon(Icons.lock_outline, color: _colors['lavender']), SizedBox(width: 10),
        Expanded(child: Text('Your data is private. Luna never shares your parenting journey without consent.', style: TextStyle(fontSize: 12, color: _colors['purple']))),
      ])),
    ])));
  }

  Widget _memoryChip(String label, IconData icon) {
    return ActionChip(avatar: Icon(icon, size: 16, color: _colors['lavender']), label: Text(label, style: TextStyle(fontSize: 12)), backgroundColor: Colors.white, side: BorderSide(color: _colors['soft']!.withOpacity(0.2)), onPressed: () {});
  }

  Widget _buildScreen(int i) {
    switch (i) {
      case 0: return _buildDiary();
      case 1: return _buildGrowth();
      case 2: return _buildChat();
      case 3: return _buildNutrition();
      case 4: return _buildProfile();
      default: return _buildChat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors['cream'],
      body: _buildScreen(_index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))]),
        child: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(5, (i) {
          bool center = i == 2;
          return GestureDetector(onTap: () => setState(() => _index = i), child: AnimatedContainer(duration: Duration(milliseconds: 200), padding: EdgeInsets.symmetric(horizontal: center ? 14 : 10, vertical: 8), decoration: center ? BoxDecoration(color: _colors['lavender']!, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: _colors['lavender']!.withOpacity(0.4), blurRadius: 12, offset: Offset(0, 4))]) : null, child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(_tabs[i]['icon'] as IconData, size: center ? 24 : 22, color: center ? Colors.white : (_index == i ? _colors['lavender'] : _colors['soft'])),
            SizedBox(height: 2),
            Text(_tabs[i]['label'] as String, style: TextStyle(fontSize: 10, fontWeight: center ? FontWeight.bold : FontWeight.normal, color: center ? Colors.white : (_index == i ? _colors['lavender'] : _colors['soft']))),
          ])));})),)))),
    );
  }
}
