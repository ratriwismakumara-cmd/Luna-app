import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/theme.dart';
import 'package:luna/widgets/luna_bottom_nav.dart';

class NutritionScreen extends StatefulWidget {
  const NutritionScreen({super.key});

  @override
  State<NutritionScreen> createState() => _NutritionScreenState();
}

class _NutritionScreenState extends State<NutritionScreen> {
  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/diary');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/growth');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 3:
        return; // already on nutrition
      case 4:
        Navigator.pushReplacementNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LunaColors.background,
      appBar: AppBar(
        title: Text(
          'Nutrition',
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: LunaColors.textSecondary,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Today's summary
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [LunaColors.gold, Color(0xFFC9A04A)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today\'s Intake',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: LunaColors.white.withOpacity(0.9),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NutrientCircle(label: 'Calories', value: '780', unit: 'kcal', target: '1,000'),
                    _NutrientCircle(label: 'Protein', value: '28', unit: 'g', target: '30'),
                    _NutrientCircle(label: 'Iron', value: '6.2', unit: 'mg', target: '7'),
                    _NutrientCircle(label: 'Calcium', value: '420', unit: 'mg', target: '500'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Meal log
          Text(
            'Today\'s Meals',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          _MealCard(
            meal: 'Breakfast',
            time: '7:30 AM',
            items: 'Oatmeal with mashed banana • Whole milk (120ml)',
            icon: Icons.wb_sunny,
            color: LunaColors.gold,
          ),
          _MealCard(
            meal: 'Morning Snack',
            time: '10:00 AM',
            items: 'Greek yogurt with pureed berries',
            icon: Icons.eco,
            color: LunaColors.mediumPurple,
          ),
          _MealCard(
            meal: 'Lunch',
            time: '12:30 PM',
            items: 'Steamed chicken & carrot puree • Rice porridge',
            icon: Icons.restaurant,
            color: LunaColors.primary,
          ),
          _MealCard(
            meal: 'Afternoon Snack',
            time: '3:00 PM',
            items: 'Sliced avocado • Teething crackers',
            icon: Icons.cookie,
            color: LunaColors.lightPurple,
          ),
          _MealCard(
            meal: 'Dinner',
            time: '6:00 PM',
            items: 'Butternut squash soup • Soft tofu cubes',
            icon: Icons.nights_stay,
            color: LunaColors.primary,
          ),
          const SizedBox(height: 24),

          // Tips section
          Text(
            'Nutrient Spotlight',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          ..._tips.map((tip) => _TipCard(tip: tip)),
          const SizedBox(height: 24),

          // Allergens
          Text(
            'Allergens Introduced',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          _AllergenGrid(),
          const SizedBox(height: 32),
        ],
      ),
      bottomNavigationBar: LunaBottomNav(
        currentIndex: 3,
        onTap: _onNavTap,
      ),
    );
  }
}

class _NutrientCircle extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String target;

  const _NutrientCircle({
    required this.label,
    required this.value,
    required this.unit,
    required this.target,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: LunaColors.white.withOpacity(0.4),
              width: 3,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 16,
                    color: LunaColors.white,
                  ),
                ),
                Text(
                  unit,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: LunaColors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: LunaColors.white.withOpacity(0.9),
          ),
        ),
        Text(
          '/ $target$unit',
          style: GoogleFonts.inter(
            fontSize: 10,
            color: LunaColors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  final String meal;
  final String time;
  final String items;
  final IconData icon;
  final Color color;

  const _MealCard({
    required this.meal,
    required this.time,
    required this.items,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LunaColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      meal,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: LunaColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      time,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: LunaColors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  items,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    height: 1.4,
                    color: LunaColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: LunaColors.grey, size: 20),
        ],
      ),
    );
  }
}

class _TipCard extends StatelessWidget {
  final String tip;
  const _TipCard({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: LunaColors.cream.withOpacity(0.5),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: LunaColors.cream),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb_outline,
              size: 18, color: LunaColors.gold),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.5,
                color: LunaColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AllergenGrid extends StatelessWidget {
  static const _allergens = [
    {'name': 'Peanuts', 'status': 'Safe ✅', 'safe': true},
    {'name': 'Eggs', 'status': 'Safe ✅', 'safe': true},
    {'name': 'Dairy', 'status': 'Safe ✅', 'safe': true},
    {'name': 'Wheat', 'status': 'Safe ✅', 'safe': true},
    {'name': 'Soy', 'status': 'Safe ✅', 'safe': true},
    {'name': 'Shellfish', 'status': 'Not yet', 'safe': false},
    {'name': 'Tree Nuts', 'status': 'Not yet', 'safe': false},
    {'name': 'Sesame', 'status': 'Not yet', 'safe': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _allergens.map((a) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: (a['safe'] as bool) ? LunaColors.white : LunaColors.lightGrey,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: (a['safe'] as bool)
                  ? LunaColors.lightPurple
                  : LunaColors.cream,
            ),
          ),
          child: Text(
            '${a['name']}  ${a['status']}',
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: LunaColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}

const _tips = [
  '🧠 Iron-rich foods support brain development at this age — pair with vitamin C for better absorption.',
  '🥛 Aim for 500ml of whole milk or equivalent dairy daily for calcium and vitamin D.',
  '🌈 Introduce a rainbow of vegetables early — repeated exposure builds acceptance over time.',
  '🚫 Avoid honey until 12+ months, and limit added salt and sugar in all meals.',
];
