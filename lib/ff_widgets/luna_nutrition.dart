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
        padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(title: 'Nutrition'),
            Padding(
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
            SizedBox(height: 14),
            // Today's Meals
            _buildMealsCard(),
            SizedBox(height: 14),
            // Hydration
            _buildHydrationCard(),
            SizedBox(height: 14),
            // Activity Context
            _buildActivityCard(),
            SizedBox(height: 14),
            // Energy & Sleep
            _buildEnergyCard(),
            SizedBox(height: 14),
            // Luna's Note
            _buildLunaNote(),
            SizedBox(height: 20),
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
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [warmCream, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
          border: Border.all(color: champagneGold, width: 1.5, strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Column(
          children: [
            Text('📸', style: TextStyle(fontSize: 30)),
            SizedBox(height: 4),
            Text('Tap to log a meal with a photo', style: TextStyle(fontSize: 12, color: textMuted)),
            SizedBox(height: 4),
            Text('Add today\'s meal', style: TextStyle(fontSize: 13, color: champagneGold, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _buildMealsCard() {
    return _card(
      children: [
        Text('Today\'s Meals', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        SizedBox(height: 14),
        _mealRow('🍳', 'Breakfast', 'Oatmeal · banana · milk'),
        _mealRow('🥗', 'Lunch', 'Rice · chicken · veg'),
        _mealRow('🍎', 'Snack', 'Apple · yogurt'),
        _mealRow('🍝', 'Dinner', 'Not logged yet'),
        SizedBox(height: 14),
        // Macros
        Container(
          padding: EdgeInsets.only(top: 14),
          decoration: BoxDecoration(
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
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: lilacWash,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 20, color: lunaPurple)),
            SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 9, color: textSoft, letterSpacing: 1)),
          ],
        ),
      ),
    );
  }

  Widget _mealRow(String emoji, String meal, String food) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text('$emoji ', style: TextStyle(fontSize: 16)),
              Text(meal, style: TextStyle(fontSize: 13, color: textDeep)),
            ],
          ),
          Text(food, style: TextStyle(fontSize: 12, color: textSoft)),
        ],
      ),
    );
  }

  Widget _buildHydrationCard() {
    return _card(
      children: [
        Text('Hydration', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('4 / 6', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 22, color: lunaPurple)),
            SizedBox(width: 8),
            Text('glasses today', style: TextStyle(fontSize: 12, color: textMuted)),
          ],
        ),
        SizedBox(height: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Container(
            height: 6,
            color: lilacWash,
            child: FractionallySizedBox(
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
        Text('Today\'s Activity Context', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Activity load', style: TextStyle(fontSize: 13, color: textMuted)),
            Text('High', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: lunaPurple)),
          ],
        ),
        SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('School + swimming + 2hr play', style: TextStyle(fontSize: 13, color: textMuted)),
            Text('est. 1,800 kcal', style: TextStyle(fontSize: 11, color: textSoft.withOpacity(0.8))),
          ],
        ),
        SizedBox(height: 8),
        Text('Higher activity days need more protein for recovery and steady carbs for energy.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
      ],
    );
  }

  Widget _buildEnergyCard() {
    return _card(
      children: [
        Text('Energy & Sleep Pattern', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        SizedBox(height: 10),
        Text('Energy dipped mid-afternoon yesterday after a poor night\'s sleep. The two are linked — consider a small protein snack at 3pm on busy days.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: insightTint,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
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
        Text('Luna\'s Note 🌙', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
        SizedBox(height: 10),
        Text('Today looks slightly low on protein for an active day. Consider adding a simple recovery snack — cheese, edamame, or hard-boiled egg.', style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.9), height: 1.7)),
      ],
    );
  }

  Widget _card({required List<Widget> children, Gradient? gradient}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: gradient,
        color: gradient == null ? bgWhite : null,
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
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
  _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'DM Serif Display',
            fontSize: 30,
            color: Color(0xFF2B2447),
            letterSpacing: 0.3,
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: 40,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xFFD8B67A), Color(0x00D8B67A)]),
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
      ],
    );
  }
}
