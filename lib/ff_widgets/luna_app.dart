/// Complete Luna App — single widget with bottom nav + all 7 screens
/// Drop this once in FlutterFlow and the whole app runs.
import 'package:flutter/material.dart';
import 'luna_widgets.dart';

class LunaApp extends StatefulWidget {
  const LunaApp({super.key});
  @override
  State<LunaApp> createState() => _LunaAppState();
}

class _LunaAppState extends State<LunaApp> {
  int _index = 2; // start on Chat tab

  static const _tabs = [
    {'icon': Icons.book_outlined, 'label': 'Diary'},
    {'icon': Icons.trending_up, 'label': 'Growth'},
    {'icon': Icons.auto_awesome, 'label': 'Luna'},  // center hero
    {'icon': Icons.restaurant, 'label': 'Nutrition'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  late final _screens = <Widget>[
    LunaDiary(),
    LunaGrowth(),
    LunaChat(),
    LunaNutrition(),
    LunaProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2))]),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (i) {
                final isCenter = i == 2;
                return GestureDetector(
                  onTap: () => setState(() => _index = i),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(horizontal: isCenter ? 14 : 10, vertical: 8),
                    decoration: isCenter
                        ? BoxDecoration(color: Color(0xFF6B5FA6), borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: Color(0xFF6B5FA6).withOpacity(0.4), blurRadius: 12, offset: Offset(0, 4))])
                        : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_tabs[i]['icon'] as IconData, size: isCenter ? 24 : 22, color: isCenter ? Colors.white : (_index == i ? Color(0xFF6B5FA6) : Color(0xFFB9A7D9))),
                        SizedBox(height: 2),
                        Text(_tabs[i]['label'] as String, style: TextStyle(fontSize: 10, fontWeight: isCenter ? FontWeight.bold : FontWeight.normal, color: isCenter ? Colors.white : (_index == i ? Color(0xFF6B5FA6) : Color(0xFFB9A7D9)))),
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
