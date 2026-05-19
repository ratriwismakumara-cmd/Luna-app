import 'package:flutter/material.dart';
import 'luna_onboarding.dart';
import 'luna_chat.dart';
import 'luna_diary.dart';
import 'luna_growth.dart';
import 'luna_nutrition.dart';
import 'luna_profile.dart';

/// LunaApp — Full app shell with onboarding gate + tab navigation
class LunaApp extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaApp({super.key, this.width, this.height});

  @override
  State<LunaApp> createState() => _LunaAppState();
}

class _LunaAppState extends State<LunaApp> {
  int _index = 2; // Luna tab
  bool _showOnboarding = true;

  static const nightIndigo = Color(0xFF2B2447);
  static const lunaPurple = Color(0xFF6B5FA6);
  static const softLavender = Color(0xFFB9A7D9);
  static const champagneGold = Color(0xFFD8B67A);
  static const goldGlow = Color(0xFFE8C77A);
  static const bgWarm = Color(0xFFFBF7F4);
  static const textSoft = Color(0xFF9A93AB);

  static const _tabs = [
    {'icon': Icons.book_outlined, 'label': 'Diary'},
    {'icon': Icons.trending_up, 'label': 'Growth'},
    {'icon': Icons.auto_awesome, 'label': 'Luna'},
    {'icon': Icons.restaurant, 'label': 'Nutrition'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  Widget _buildScreen(int i) {
    switch (i) {
      case 0: return const LunaDiary();
      case 1: return const LunaGrowth();
      case 2: return const LunaChat();
      case 3: return const LunaNutrition();
      case 4: return const LunaProfile();
      default: return const LunaChat();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showOnboarding) {
      return LunaOnboarding(
        onComplete: () => setState(() => _showOnboarding = false),
      );
    }

    return Scaffold(
      backgroundColor: bgWarm,
      body: _buildScreen(_index),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bgWarm,
          gradient: const LinearGradient(
            colors: [Color(0x99FBF7F4), Color(0xFFFBF7F4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(5, (i) {
                final center = i == 2;
                if (center) {
                  return _buildNavLuna();
                }
                return _buildNavItem(i);
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int i) {
    final active = i == _index;
    final tab = _tabs[i];
    return GestureDetector(
      onTap: () => setState(() => _index = i),
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              tab['icon'] as IconData,
              size: 22,
              color: active ? lunaPurple : textSoft,
            ),
            const SizedBox(height: 4),
            Text(
              tab['label'] as String,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: active ? nightIndigo : textSoft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavLuna() {
    final active = _index == 2;
    return GestureDetector(
      onTap: () => setState(() => _index = 2),
      child: SizedBox(
        width: 56,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: active
                    ? const LinearGradient(colors: [champagneGold, goldGlow])
                    : const LinearGradient(colors: [lunaPurple, softLavender]),
                boxShadow: [
                  BoxShadow(
                    color: active ? champagneGold.withOpacity(0.45) : lunaPurple.withOpacity(0.45),
                    blurRadius: 28,
                    offset: const Offset(0, 10),
                  ),
                  BoxShadow(
                    color: const Color(0xFFF7EAD6).withOpacity(0.6),
                    blurRadius: 0,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '✦',
                  style: TextStyle(
                    fontFamily: 'DM Serif Display',
                    fontSize: 24,
                    color: active ? nightIndigo : bgWarm,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Luna',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: lunaPurple,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
