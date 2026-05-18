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

  final purple = Color(0xFF2B2447);
  final lavender = Color(0xFF6B5FA6);
  final soft = Color(0xFFB9A7D9);
  final gold = Color(0xFFD8B67A);
  final cream = Color(0xFFF7EAD6);

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

  Widget _buildDiary() {
    return Container(color: cream, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('📝', style: TextStyle(fontSize: 48)),
      SizedBox(height: 16),
      Text('Your Diary', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 8),
      Text('5 entries this week · 4-day streak 🔥', style: TextStyle(fontSize: 14, color: lavender)),
    ])));
  }

  Widget _buildGrowth() {
    return Container(color: cream, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('📊', style: TextStyle(fontSize: 48)),
      SizedBox(height: 16),
      Text('Growth', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 8),
      Text('Track milestones & development', style: TextStyle(fontSize: 14, color: lavender)),
    ])));
  }

  Widget _buildChat() {
    return Container(color: cream, child: Column(children: [
      Container(height: 48, color: Colors.white, child: ListView(scrollDirection: Axis.horizontal, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8), children: ['Crisis', 'Reflection', 'Milestone', 'Bonding', 'Wellness', 'Observation'].map((m) => Padding(padding: EdgeInsets.only(right: 8), child: ActionChip(label: Text(m, style: TextStyle(fontSize: 11)), backgroundColor: soft.withOpacity(0.15), side: BorderSide.none, onPressed: () {}))).toList())),
      Expanded(child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('🌙', style: TextStyle(fontSize: 56)),
        SizedBox(height: 16),
        Text('Hi! I\'m Luna.', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: purple)),
        SizedBox(height: 8),
        Text('How can I support you today?', style: TextStyle(fontSize: 16, color: lavender)),
      ]))),
      Container(color: Colors.white, padding: EdgeInsets.all(12), child: Row(children: [
        IconButton(icon: Icon(Icons.mic, color: lavender), onPressed: () {}),
        Expanded(child: TextField(decoration: InputDecoration(hintText: 'Share your thoughts...', border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none), fillColor: cream, filled: true, contentPadding: EdgeInsets.symmetric(horizontal: 16)))),
        SizedBox(width: 6),
        CircleAvatar(backgroundColor: purple, radius: 20, child: Icon(Icons.send, color: Colors.white, size: 16)),
      ])),
    ]));
  }

  Widget _buildNutrition() {
    return Container(color: cream, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('🥗', style: TextStyle(fontSize: 48)),
      SizedBox(height: 16),
      Text('Nutrition', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 8),
      Text('Activity: Medium · ~1,400 kcal today', style: TextStyle(fontSize: 14, color: lavender)),
      SizedBox(height: 4),
      Text('4 meals logged', style: TextStyle(fontSize: 13, color: gold)),
    ])));
  }

  Widget _buildProfile() {
    return Container(color: cream, child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      CircleAvatar(radius: 36, backgroundColor: lavender, child: Text('R', style: TextStyle(fontSize: 28, color: Colors.white))),
      SizedBox(height: 16),
      Text('Profile & Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 8),
      Text('10 active frameworks · AI memory controls', style: TextStyle(fontSize: 13, color: lavender)),
    ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      body: _buildScreen(_index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))]),
        child: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6), child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: List.generate(5, (i) {
          bool center = i == 2;
          return GestureDetector(onTap: () => setState(() => _index = i), child: AnimatedContainer(duration: Duration(milliseconds: 200), padding: EdgeInsets.symmetric(horizontal: center ? 14 : 10, vertical: 8), decoration: center ? BoxDecoration(color: lavender, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: lavender.withOpacity(0.4), blurRadius: 12, offset: Offset(0, 4))]) : null, child: Column(mainAxisSize: MainAxisSize.min, children: [
            Icon(_tabs[i]['icon'] as IconData, size: center ? 24 : 22, color: center ? Colors.white : (_index == i ? lavender : soft)),
            SizedBox(height: 2),
            Text(_tabs[i]['label'] as String, style: TextStyle(fontSize: 10, fontWeight: center ? FontWeight.bold : FontWeight.normal, color: center ? Colors.white : (_index == i ? lavender : soft))),
          ])));})),)))),
    );
  }
}
