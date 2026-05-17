import 'package:flutter/material.dart';

class LunaApp extends StatefulWidget {
  const LunaApp({super.key});
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

  Widget _buildScreen(int i) {
    switch (i) {
      case 0: return _buildPlaceholder('📝 Diary', 'Your parenting diary entries appear here');
      case 1: return _buildPlaceholder('📊 Growth', 'Track milestones and development');
      case 2: return _buildChat();
      case 3: return _buildPlaceholder('🥗 Nutrition', 'Meal tracking and activity context');
      case 4: return _buildPlaceholder('👤 Profile', 'Frameworks and settings');
      default: return _buildChat();
    }
  }

  Widget _buildPlaceholder(String title, String subtitle) {
    return Container(
      color: Color(0xFFF7EAD6),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 28, color: Color(0xFF2B2447))),
            SizedBox(height: 8),
            Text(subtitle, style: TextStyle(fontSize: 16, color: Color(0xFF6B5FA6))),
          ],
        ),
      ),
    );
  }

  Widget _buildChat() {
    return Container(
      color: Color(0xFFF7EAD6),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Text('🌙 Luna', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
          ),
          Container(
            height: 50,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              children: ['Crisis', 'Reflection', 'Milestone', 'Bonding', 'Wellness', 'Observation']
                  .map((m) => Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: ActionChip(
                          label: Text(m, style: TextStyle(fontSize: 12)),
                          backgroundColor: Color(0xFFB9A7D9).withOpacity(0.15),
                          onPressed: () {},
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('🌙', style: TextStyle(fontSize: 48)),
                  SizedBox(height: 16),
                  Text('Hi! I\'m Luna.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2B2447))),
                  SizedBox(height: 8),
                  Text('How can I support you today?', style: TextStyle(fontSize: 16, color: Color(0xFF6B5FA6))),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                IconButton(icon: Icon(Icons.mic, color: Color(0xFF6B5FA6)), onPressed: () {}),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Share your thoughts...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                      fillColor: Color(0xFFF7EAD6),
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(icon: Icon(Icons.camera_alt, color: Color(0xFF6B5FA6)), onPressed: () {}),
                CircleAvatar(
                  backgroundColor: Color(0xFF6B5FA6),
                  child: Icon(Icons.send, color: Colors.white, size: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7EAD6),
      body: _buildScreen(_index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (i) {
                bool center = i == 2;
                return GestureDetector(
                  onTap: () => setState(() => _index = i),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: center ? 14 : 10, vertical: 8),
                    decoration: center
                        ? BoxDecoration(
                            color: Color(0xFF6B5FA6),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [BoxShadow(color: Color(0xFF6B5FA6).withOpacity(0.4), blurRadius: 12, offset: Offset(0, 4))],
                          )
                        : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _tabs[i]['icon'] as IconData,
                          size: center ? 24 : 22,
                          color: center
                              ? Colors.white
                              : (_index == i ? Color(0xFF6B5FA6) : Color(0xFFB9A7D9)),
                        ),
                        SizedBox(height: 2),
                        Text(
                          _tabs[i]['label'] as String,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: center ? FontWeight.bold : FontWeight.normal,
                            color: center
                                ? Colors.white
                                : (_index == i ? Color(0xFF6B5FA6) : Color(0xFFB9A7D9)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
