import 'package:flutter/material.dart';

/// LunaNutrition — Meal tracking & activity context for growing bodies
class LunaNutrition extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaNutrition({super.key, this.width, this.height});

  // ── Design tokens ──
  static const nightIndigo = Color(0xFF2B2447);
  static const lunaPurple = Color(0xFF6B5FA6);
  static const softLavender = Color(0xFFB9A7D9);
  static const lilacWash = Color(0xFFF4EEF6);
  static const warmCream = Color(0xFFF7EAD6);
  static const champagneGold = Color(0xFFD8B67A);
  static const bgWarm = Color(0xFFFBF7F4);
  static const bgWhite = Color(0xFFFCFAF7);
  static const textDeep = Color(0xFF2B2447);
  static const textMuted = Color(0xFF6E687A);
  static const textSoft = Color(0xFF9A93AB);
  static const lineFaint = Color(0xFFF0EBF2);
  static const insightTint = Color(0xFFDCE3EE);
  static const insightText = Color(0xFF6F84A0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgWarm,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _SectionHeader(title: 'Nutrition'),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 4, 24, 12),
              child: Text(
                'Fuel for growing bodies, no guilt',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cormorant Garamond',
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: lunaPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            // Photo upload CTA
            _buildPhotoUpload(),
            const SizedBox(height: 14),
            // Today's Meals
            _buildMealsCard(),
            const SizedBox(height: 14),
            // Hydration
            _buildHydrationCard(),
            const SizedBox(height: 14),
            // Activity Context
            _buildActivityCard(),
            const SizedBox(height: 14),
            // Energy & Sleep
            _buildEnergyCard(),
            const SizedBox(height: 14),
            // Luna's Note
            _buildLunaNote(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoUpload() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [warmCream, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
          border: Border.all(color: champagneGold, width: 1.5, strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Column(
          children: [
            const Text('📸', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 4),
            const Text('Tap to log a meal with a photo', style: TextStyle(fontSize: 12, color: textMuted)),
            const SizedBox(height: 4),
            const Text('Add today\'s meal', style: TextStyle(fontSize: 13, color: champagneGold, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildMealsCard() {
    return _card(
      children: [
        const Text('Today\'s Meals', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        const SizedBox(height: 14),
        _mealRow('🍳', 'Breakfast', 'Oatmeal · banana · milk'),
        _mealRow('🥗', 'Lunch', 'Rice · chicken · veg'),
        _mealRow('🍎', 'Snack', 'Apple · yogurt'),
        _mealRow('🍝', 'Dinner', 'Not logged yet'),
        const SizedBox(height: 14),
        // Macros
        Container(
          padding: const EdgeInsets.only(top: 14),
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: lineFaint)),
          ),
          child: Row(
            children: [
              _macroItem('58g', 'Protein'),
              _macroItem('210g', 'Carbs'),
              _macroItem('42g', 'Fat'),
              _macroItem('72%', 'Daily'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _macroItem(String value, String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: lilacWash,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontFamily: 'DM Serif Display', fontSize: 20, color: lunaPurple)),
            const SizedBox(height: 2),
            Text(label, style: const TextStyle(fontSize: 9, color: textSoft, letterSpacing: 1)),
          ],
        ),
      ),
    );
  }

  Widget _mealRow(String emoji, String meal, String food) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('$emoji ', style: const TextStyle(fontSize: 16)),
              Text(meal, style: const TextStyle(fontSize: 13, color: textDeep)),
            ],
          ),
          Text(food, style: const TextStyle(fontSize: 12, color: textSoft)),
        ],
      ),
    );
  }

  Widget _buildHydrationCard() {
    return _card(
      children: [
        const Text('Hydration', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            const Text('4 / 6', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 22, color: lunaPurple)),
            const SizedBox(width: 8),
            const Text('glasses today', style: TextStyle(fontSize: 12, color: textMuted)),
          ],
        ),
        const SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            height: 6,
            color: lilacWash,
            child: const FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.67,
              child: ColoredBox(
                color: lunaPurple,
                child: SizedBox.expand(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActivityCard() {
    return _card(
      gradient: LinearGradient(colors: [lilacWash, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
      children: [
        const Text('Today\'s Activity Context', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Activity load', style: TextStyle(fontSize: 13, color: textMuted)),
            const Text('High', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: lunaPurple)),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('School + swimming + 2hr play', style: TextStyle(fontSize: 13, color: textMuted)),
            Text('est. 1,800 kcal', style: TextStyle(fontSize: 11, color: textSoft.withOpacity(0.8))),
          ],
        ),
        const SizedBox(height: 8),
        Text('Higher activity days need more protein for recovery and steady carbs for energy.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
      ],
    );
  }

  Widget _buildEnergyCard() {
    return _card(
      children: [
        const Text('Energy & Sleep Pattern', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        const SizedBox(height: 10),
        Text('Energy dipped mid-afternoon yesterday after a poor night\'s sleep. The two are linked — consider a small protein snack at 3pm on busy days.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: insightTint,
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Pattern noticed',
            style: TextStyle(fontSize: 10, color: insightText, fontWeight: FontWeight.w600, letterSpacing: 0.5),
          ),
        ),
      ],
    );
  }

  Widget _buildLunaNote() {
    return _card(
      gradient: LinearGradient(colors: [warmCream, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
      children: [
        const Text('Luna\'s Note 🌙', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        const SizedBox(height: 10),
        Text('Today looks slightly low on protein for an active day. Consider adding a simple recovery snack — cheese, edamame, or hard-boiled egg.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
      ],
    );
  }

  Widget _card({required List<Widget> children, Gradient? gradient}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: gradient,
        color: gradient == null ? bgWhite : null,
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: const Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 30,
            color: Color(0xFF2B2447),
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 40,
          height: 2,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFD8B67A), Color(0x00D8B67A)]),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ],
    );
  }
}
