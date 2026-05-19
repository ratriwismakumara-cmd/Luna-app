import 'package:flutter/material.dart';

/// LunaOnboarding — 7-step onboarding flow
/// Replaces LunaChat as the landing page for first-time users
class LunaOnboarding extends StatefulWidget {
  final double? width;
  final double? height;
  final VoidCallback? onComplete;
  const LunaOnboarding({super.key, this.width, this.height, this.onComplete});

  @override
  State<LunaOnboarding> createState() => _LunaOnboardingState();
}

class _LunaOnboardingState extends State<LunaOnboarding> {
  // ── Design tokens ──
  static const nightIndigo = Color(0xFF2B2447);
  static const lunaPurple = Color(0xFF6B5FA6);
  static const softLavender = Color(0xFFB9A7D9);
  static const paleLilac = Color(0xFFE7DDF4);
  static const lilacWash = Color(0xFFF4EEF6);
  static const warmCream = Color(0xFFF7EAD6);
  static const champagneGold = Color(0xFFD8B67A);
  static const bgWarm = Color(0xFFFBF7F4);
  static const bgWhite = Color(0xFFFCFAF7);
  static const textDeep = Color(0xFF2B2447);
  static const textMuted = Color(0xFF6E687A);
  static const textSoft = Color(0xFF9A93AB);
  static const lineSoft = Color(0xFFE7E0EB);
  static const lineFaint = Color(0xFFF0EBF2);

  int _step = 1;
  final int _totalSteps = 7;

  // Selections
  String _role = 'Co-parent';
  String _childAge = '8 years';
  final Set<String> _traits = {'Sensitive', 'Curious', 'Thoughtful'};
  final Set<String> _styles = {'Structured', 'Warm'};
  final Set<String> _priorities = {'Emotional regulation', 'Confidence'};

  final List<String> _roles = ['Parent', 'Co-parent', 'Caregiver / Guardian', 'Expecting parent'];
  final List<String> _traitsList = ['Sensitive', 'Curious', 'Independent', 'Thoughtful', 'Energetic', 'Shy'];
  final List<String> _stylesList = ['Structured', 'Warm', 'Flexible', 'Growth-focused', 'Independence-building', 'Nurturing'];
  final List<String> _prioritiesList = ['Emotional regulation', 'Confidence', 'Friendships', 'Discipline', 'Nutrition', 'Learning'];

  void _next() {
    if (_step < _totalSteps) {
      setState(() => _step++);
    } else {
      widget.onComplete?.call();
    }
  }

  void _finish() {
    widget.onComplete?.call();
  }

  void _toggleSelection(Set<String> set, String item) {
    setState(() {
      if (set.contains(item)) {
        set.remove(item);
      } else {
        set.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgWarm,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _buildStep(_step),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(int step) {
    switch (step) {
      case 1: return _buildWelcome();
      case 2: return _buildWhosParenting();
      case 3: return _buildChildProfile();
      case 4: return _buildParentingStyle();
      case 5: return _buildPriorities();
      case 6: return _buildHowLunaGuides();
      case 7: return _buildReady();
      default: return _buildWelcome();
    }
  }

  Widget _stepIndicator(int current, int total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(total, (i) {
          final idx = i + 1;
          final isCurrent = idx == current;
          final isDone = idx < current;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isCurrent ? 24 : 6,
            height: 6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isCurrent ? 4 : 3),
              gradient: isCurrent
                  ? const LinearGradient(colors: [lunaPurple, softLavender])
                  : null,
              color: isDone ? softLavender : lineSoft,
            ),
          );
        }),
      ),
    );
  }

  Widget _navButtons({bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isLast)
            TextButton(
              onPressed: _finish,
              child: const Text('Skip', style: TextStyle(color: textMuted, fontSize: 13, fontWeight: FontWeight.w500)),
            ),
          if (!isLast) const SizedBox(width: 14),
          ElevatedButton(
            onPressed: isLast ? _finish : _next,
            style: ElevatedButton.styleFrom(
              backgroundColor: isLast ? lunaPurple : nightIndigo,
              foregroundColor: bgWarm,
              padding: EdgeInsets.symmetric(horizontal: isLast ? 28 : 30, vertical: isLast ? 14 : 13),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              elevation: isLast ? 0 : 0,
              shadowColor: Colors.transparent,
            ),
            child: Text(
              isLast ? 'Begin Your Journey ✨' : 'Next →',
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════ STEP 1: WELCOME ═══════════
  Widget _buildWelcome() {
    return _onboardStep(
      key: const ValueKey(1),
      icon: '🌙',
      title: 'Welcome to Luna',
      subtitle: 'A calm space to reflect, understand, and grow together with your child. No judgment. No pressure.',
      extra: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: lilacWash,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Row(
          children: [
            Text('🔒 ', style: TextStyle(fontSize: 14)),
            Expanded(
              child: Text(
                'Private. Secure. Yours. Everything you share stays encrypted and family-only.',
                style: TextStyle(fontSize: 11, color: lunaPurple, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
      step: 1,
    );
  }

  // ═══════════ STEP 2: WHO'S PARENTING ═══════════
  Widget _buildWhosParenting() {
    return _onboardStep(
      key: const ValueKey(2),
      icon: '👋',
      title: 'Who\'s parenting?',
      subtitle: 'This helps Luna tailor language and context to you.',
      extra: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: _roles.map((role) {
            final selected = _role == role;
            return GestureDetector(
              onTap: () => setState(() => _role = role),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
                decoration: BoxDecoration(
                  color: selected ? lilacWash : bgWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: selected ? lunaPurple : lineSoft, width: 1.5),
                ),
                child: Center(
                  child: Text(role, style: TextStyle(fontSize: 13, color: selected ? lunaPurple : textDeep, fontWeight: selected ? FontWeight.w500 : FontWeight.w400)),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      step: 2,
    );
  }

  // ═══════════ STEP 3: CHILD PROFILE ═══════════
  Widget _buildChildProfile() {
    return _onboardStep(
      key: const ValueKey(3),
      icon: '✨',
      title: 'Tell me about your child',
      subtitle: 'Age, personality, and what makes them unique. The more Luna understands, the more personal the guidance becomes.',
      extra: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
              decoration: BoxDecoration(
                color: bgWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: lineSoft),
              ),
              child: TextField(
                decoration: const InputDecoration.collapsed(hintText: 'Child\'s age (e.g., 8 years)'),
                style: const TextStyle(fontSize: 13),
                onChanged: (v) => _childAge = v,
              ),
            ),
            const SizedBox(height: 14),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Personality traits', style: TextStyle(fontSize: 11, color: textSoft)),
            ),
            const SizedBox(height: 8),
            _buildChipGrid(_traitsList, _traits),
          ],
        ),
      ),
      step: 3,
    );
  }

  // ═══════════ STEP 4: PARENTING STYLE ═══════════
  Widget _buildParentingStyle() {
    return _onboardStep(
      key: const ValueKey(4),
      icon: '🌱',
      title: 'Your parenting style',
      subtitle: 'Luna will adapt its tone and guidance to match your values.',
      extra: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildChipGrid(_stylesList, _styles),
      ),
      step: 4,
    );
  }

  // ═══════════ STEP 5: PRIORITIES ═══════════
  Widget _buildPriorities() {
    return _onboardStep(
      key: const ValueKey(5),
      icon: '🎯',
      title: 'Your priorities right now',
      subtitle: 'What matters most for your family this season?',
      extra: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildChipGrid(_prioritiesList, _priorities),
      ),
      step: 5,
    );
  }

  // ═══════════ STEP 6: HOW LUNA GUIDES ═══════════
  Widget _buildHowLunaGuides() {
    return _onboardStep(
      key: const ValueKey(6),
      icon: '🧭',
      title: 'How Luna guides you',
      subtitle: 'Luna isn\'t a generic AI. Here\'s how guidance is shaped:',
      extra: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _buildGuideCard('✦ Personalized', 'Luna learns from your child\'s profile and daily moments you share.', lunaPurple),
            const SizedBox(height: 10),
            _buildGuideCard('📚 Framework-backed', 'Luna uses trusted parenting frameworks — Whole-Brain Child, Emotion Coaching, CASEL, IB, and more.', champagneGold),
            const SizedBox(height: 10),
            _buildGuideCard('🔒 Private', 'Your family data stays encrypted and family-only. You control everything.', softLavender),
          ],
        ),
      ),
      step: 6,
    );
  }

  Widget _buildGuideCard(String title, String desc, Color accent) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgWhite,
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: accent, width: 3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontFamily: 'DM Serif Display', fontSize: 15, color: textDeep)),
          const SizedBox(height: 4),
          Text(desc, style: const TextStyle(fontSize: 12, color: textMuted, height: 1.6)),
        ],
      ),
    );
  }

  // ═══════════ STEP 7: READY ═══════════
  Widget _buildReady() {
    return _onboardStep(
      key: const ValueKey(7),
      icon: '💫',
      title: 'You\'re ready',
      subtitle: 'Luna will grow with your family — learning patterns, remembering moments, and helping you parent with intention.',
      extra: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              '"Growing together. Intentionally."',
              style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 16, fontStyle: FontStyle.italic, color: lunaPurple),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: lilacWash,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Text(
              '📤 Optional later: upload assessments, school reports, developmental notes • invite co-parent to sync',
              style: TextStyle(fontSize: 11, color: lunaPurple, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          _navButtons(isLast: true),
        ],
      ),
      step: 7,
      showNav: false,
    );
  }

  // ═══════════ UTILITY BUILDERS ═══════════
  Widget _onboardStep({
    required Key key,
    required String icon,
    required String title,
    required String subtitle,
    required Widget extra,
    required int step,
    bool showNav = true,
  }) {
    return SingleChildScrollView(
      key: key,
      padding: const EdgeInsets.fromLTRB(36, 40, 36, 20),
      child: Column(
        children: [
          Container(
            width: 76, height: 76,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [paleLilac, lilacWash],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [BoxShadow(color: softLavender.withOpacity(0.25), blurRadius: 24, offset: const Offset(0, 8))],
            ),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 36))),
          ),
          const SizedBox(height: 24),
          Text(title, style: const TextStyle(fontFamily: 'DM Serif Display', fontSize: 32, color: textDeep, letterSpacing: 0.2)),
          const SizedBox(height: 12),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, color: textMuted, height: 1.75)),
          const SizedBox(height: 16),
          extra,
          const SizedBox(height: 4),
          _stepIndicator(step, _totalSteps),
          if (showNav && step < 7) _navButtons(),
        ],
      ),
    );
  }

  Widget _buildChipGrid(List<String> items, Set<String> selected) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        final isSelected = selected.contains(item);
        return GestureDetector(
          onTap: () => _toggleSelection(selected, item),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? lilacWash : bgWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isSelected ? lunaPurple : lineSoft, width: 1.5),
            ),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 13,
                color: isSelected ? lunaPurple : textDeep,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
