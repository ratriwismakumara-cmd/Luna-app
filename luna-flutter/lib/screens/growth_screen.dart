import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/theme.dart';
import 'package:luna/widgets/luna_bottom_nav.dart';

class GrowthScreen extends StatefulWidget {
  const GrowthScreen({super.key});

  @override
  State<GrowthScreen> createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  void _onNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/diary');
        break;
      case 1:
        return; // already on growth
      case 2:
        Navigator.pushReplacementNamed(context, '/chat');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/nutrition');
        break;
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
          'Growth',
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
          // Growth summary card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [LunaColors.primary, LunaColors.mediumPurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Aruna — 14 months',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: LunaColors.white.withOpacity(0.9),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.info_outline,
                        color: LunaColors.white.withOpacity(0.6), size: 20),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatItem(label: 'Weight', value: '9.8 kg', sub: '50th %ile'),
                    _StatItem(label: 'Height', value: '78 cm', sub: '65th %ile'),
                    _StatItem(label: 'Head', value: '46 cm', sub: '55th %ile'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Milestones section
          Text(
            'Recent Milestones',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          _MilestoneCard(
            icon: Icons.directions_walk,
            title: 'First Steps',
            date: 'May 13, 2026',
            description:
                'Took 3 independent steps from couch to parent. Walking with support now.',
            achieved: true,
          ),
          _MilestoneCard(
            icon: Icons.record_voice_over,
            title: 'First Word — "Mama"',
            date: 'April 28, 2026',
            description: 'Said "mama" clearly while reaching for parent. Starting to babble more complex sounds.',
            achieved: true,
          ),
          _MilestoneCard(
            icon: Icons.restaurant,
            title: 'Self-Feeding with Spoon',
            date: 'Expected: June 2026',
            description: 'Starting to show interest in holding spoon. Currently practicing with finger foods.',
            achieved: false,
          ),
          _MilestoneCard(
            icon: Icons.wb_sunny,
            title: 'Points to Body Parts',
            date: 'Expected: July 2026',
            description: 'Can identify nose and mouth when asked. Building body awareness through play.',
            achieved: false,
          ),
          const SizedBox(height: 24),
          // Growth chart placeholder
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LunaColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Growth Chart',
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    const Spacer(),
                    Text(
                      'Weight • Height',
                      style: GoogleFonts.inter(fontSize: 12, color: LunaColors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Simplified chart visualization
                _SimpleGrowthChart(),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
      bottomNavigationBar: LunaBottomNav(
        currentIndex: 1,
        onTap: _onNavTap,
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final String sub;

  const _StatItem({
    required this.label,
    required this.value,
    required this.sub,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 20,
            color: LunaColors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: LunaColors.white.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: LunaColors.gold,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _MilestoneCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String date;
  final String description;
  final bool achieved;

  const _MilestoneCard({
    required this.icon,
    required this.title,
    required this.date,
    required this.description,
    required this.achieved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: LunaColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: achieved ? LunaColors.lightPurple : LunaColors.cream,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: achieved
                  ? LunaColors.lightPurple.withOpacity(0.3)
                  : LunaColors.cream,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 22,
              color: achieved ? LunaColors.mediumPurple : LunaColors.gold,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: LunaColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: LunaColors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    height: 1.4,
                    color: LunaColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            achieved ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 24,
            color: achieved ? LunaColors.mediumPurple : LunaColors.grey,
          ),
        ],
      ),
    );
  }
}

class _SimpleGrowthChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final months = ['9m', '10m', '11m', '12m', '13m', '14m'];
    return SizedBox(
      height: 140,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(months.length, (index) {
          final height = [60.0, 80.0, 85.0, 95.0, 110.0, 120.0];
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height[index],
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          LunaColors.mediumPurple,
                          LunaColors.lightPurple,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    months[index],
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: LunaColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
