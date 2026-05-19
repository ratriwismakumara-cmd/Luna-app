import 'package:flutter/material.dart';

/// LunaGrowth — Developmental insights with framework-backed metrics
class LunaGrowth extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaGrowth({super.key, this.width, this.height});

  @override
  State<LunaGrowth> createState() => _LunaGrowthState();
}

class _LunaGrowthState extends State<LunaGrowth> {
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
  static const lineSoft = Color(0xFFE7E0EB);
  static const calmTint = Color(0xFFDBE8DC);
  static const calmText = Color(0xFF6A8C72);
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
            const _SectionHeader(title: 'Growth'),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 4, 24, 12),
              child: Text(
                'Developmental insights, backed by frameworks',
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
            _buildGrowthCard(
              title: 'Emotional Regulation',
              value: 'Rising',
              label: '3-month trend',
              barWidth: 0.78,
              note: 'Your child is increasingly able to name emotions and take space before reacting.',
              sourceLabels: [
                _SourceLabel('📝 Based on parent logs', 'parent-log'),
                _SourceLabel('👁 Luna observation', 'luna-obs'),
              ],
              framework: '✦ Framework: CASEL · Emotion Coaching',
            ),
            const SizedBox(height: 14),
            _buildGrowthCard(
              title: 'Social Confidence',
              value: '+4',
              label: 'new social skills observed this quarter',
              barWidth: 0.65,
              note: 'Initiating play · sharing · handling disagreement · expressing needs',
              sourceLabels: [
                _SourceLabel('📝 Parent logs', 'parent-log'),
                _SourceLabel('🏫 School report', 'school'),
              ],
              framework: '✦ Framework: SEL · IB Learner Profile (Communicator, Caring)',
            ),
            const SizedBox(height: 14),
            _buildGrowthCard(
              title: 'Communication Development',
              value: 'Strong',
              label: 'verbal articulation',
              barWidth: 0.85,
              note: 'Shows above-age verbal expression based on uploaded assessment.',
              sourceLabels: [
                _SourceLabel('📊 Uploaded assessment', 'assessment'),
                _SourceLabel('🏫 School report', 'school'),
              ],
              framework: '✦ Source: school report (Apr 2026), psychotest assessment',
            ),
            const SizedBox(height: 14),
            // Areas to Nurture
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: LinearGradient(colors: [warmCream, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [
                  BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: const Offset(0, 10)),
                  BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: const Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Areas to Nurture 🌱', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
                  const SizedBox(height: 12),
                  _areaItem('Perfectionism — hard on themselves when things aren\'t right'),
                  _areaItem('Transition resilience — struggles stopping one activity for another'),
                  _areaItem('Sleep consistency — bedtime resistance peaks on school nights'),
                  const SizedBox(height: 8),
                  Text('✦ Framework: Gardener Philosophy · Whole-Brain Child', style: TextStyle(fontSize: 10, color: lunaPurple, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Assessment Vault
            _buildAssessmentVault(),
          ],
        ),
      ),
    );
  }

  Widget _areaItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('✦ ', style: TextStyle(fontSize: 12, color: lunaPurple)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 12, color: textMuted, height: 1.7))),
        ],
      ),
    );
  }

  Widget _buildGrowthCard({
    required String title,
    required String value,
    required String label,
    required double barWidth,
    required String note,
    required List<_SourceLabel> sourceLabels,
    required String framework,
  }) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFDFA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: const Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontFamily: 'DM Serif Display',
                  fontSize: 28,
                  foreground: Paint()..shader = LinearGradient(colors: [lunaPurple, champagneGold]).createShader(const Rect.fromLTWH(0, 0, 200, 40)),
                ),
              ),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontSize: 12, color: textMuted)),
            ],
          ),
          const SizedBox(height: 12),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Container(
              height: 6,
              color: lilacWash,
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: barWidth,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                    gradient: LinearGradient(colors: [lunaPurple, softLavender]),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(note, style: const TextStyle(fontSize: 12, color: textMuted, height: 1.7)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: sourceLabels,
          ),
          const SizedBox(height: 4),
          Text(framework, style: TextStyle(fontSize: 10, color: lunaPurple, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildAssessmentVault() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Vault header card
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: lilacWash,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: softLavender, width: 1.5, strokeAlign: BorderSide.strokeAlignInside),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('📂 Assessment Vault', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 17, color: lunaPurple)),
                const SizedBox(height: 4),
                Text('Upload reports to deepen Luna\'s understanding — psychotest, school feedback, developmental notes.', style: TextStyle(fontSize: 11, color: textMuted.withOpacity(0.9), height: 1.5)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Upload mini grid
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.8,
          ),
          children: [
            _buildUploadMini('📋', 'School Report', '2 uploaded'),
            _buildUploadMini('🧠', 'Psychotest', '1 uploaded'),
            _buildUploadMini('📝', 'Teacher Notes', 'Tap to add'),
            _buildUploadMini('📊', 'Developmental', 'Tap to add'),
          ],
        ),
      ],
    );
  }

  Widget _buildUploadMini(String icon, String label, String status) {
    final isAdd = status == 'Tap to add';
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: lineSoft, width: 1.5, strokeAlign: BorderSide.strokeAlignInside),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: textDeep)),
            const SizedBox(height: 2),
            Text(status, style: TextStyle(fontSize: 9, color: isAdd ? textSoft : textSoft)),
          ],
        ),
      ),
    );
  }
}

/// Source label chip (📝 Parent logs, 👁 Luna observation, etc.)
class _SourceLabel extends StatelessWidget {
  final String text;
  final String type; // 'parent-log', 'luna-obs', 'assessment', 'school'

  const _SourceLabel(this.text, this.type);

  @override
  Widget build(BuildContext context) {
    final colors = {
      'parent-log': [Color(0xFFF4EEF6), Color(0xFF6B5FA6)],
      'luna-obs': [Color(0xFFDBE8DC), Color(0xFF6A8C72)],
      'assessment': [Color(0xFFF7EAD6), Color(0xFFB89048)],
      'school': [Color(0xFFDCE3EE), Color(0xFF6F84A0)],
    };
    final c = colors[type] ?? colors['parent-log']!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: c[0],
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(text, style: TextStyle(fontSize: 10, color: c[1], fontWeight: FontWeight.w500)),
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
