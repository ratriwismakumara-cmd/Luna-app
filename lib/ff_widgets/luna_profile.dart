import 'package:flutter/material.dart';

/// LunaProfile — Family profile, frameworks, AI memory controls & privacy
class LunaProfile extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaProfile({super.key, this.width, this.height});

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
  static const crisisText = Color(0xFFB05E55);
  static const lineFaint = Color(0xFFF0EBF2);

  static const _frameworks = [
    'Whole-Brain Child', 'Emotion Coaching', 'Gardener Philosophy',
    'CASEL / SEL', 'IB Learner Profile', 'Polyvagal-informed',
    'Ellyn Satter', 'Orchid & Dandelion',
  ];

  static const _memoryControls = [
    {'label': 'Edit what Luna remembers', 'danger': false},
    {'label': 'Forget specific moments', 'danger': false},
    {'label': 'Consent & privacy settings', 'danger': false},
    {'label': 'Co-parent permissions', 'danger': false},
    {'label': 'Export your data', 'danger': false},
    {'label': 'Delete all data', 'danger': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgWarm,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 8, 20, 20),
        child: Column(
          children: [
            // Section header
            _SectionHeader(title: 'Family'),
            SizedBox(height: 16),
            // Avatar
            Container(
              width: 86, height: 86,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [softLavender, lunaPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [BoxShadow(color: lunaPurple.withOpacity(0.3), blurRadius: 30, offset: Offset(0, 12))],
              ),
              child: Center(
                child: Text('👨👩👧', style: TextStyle(fontSize: 34)),
              ),
            ),
            SizedBox(height: 20),

            // Your Child card
            _buildProfileCard(
              title: 'Your Child',
              rows: [
                _InfoRow(label: 'Age', value: '8 years'),
                _InfoRow(label: 'School type', value: 'IB Year 3'),
                _InfoRow(label: 'Personality', value: 'Sensitive · Curious · Thoughtful'),
                _InfoRow(label: 'Learning style', value: 'Reflective · Conceptual'),
              ],
            ),
            SizedBox(height: 12),

            // Parenting Philosophy
            _buildProfileCard(
              title: 'Parenting Philosophy',
              rows: [
                _InfoRow(label: 'Style', value: 'Warm & Structured'),
                _InfoRow(label: 'Focus', value: 'Emotional resilience'),
                _InfoRow(label: 'Communication', value: 'Connection-based'),
              ],
            ),
            SizedBox(height: 12),

            // Family Rules
            _buildProfileCard(
              title: 'Family Rules',
              rows: [
                _InfoRow(label: 'Screen time', value: '2 hrs / weekday'),
                _InfoRow(label: 'Bedtime', value: '20:00 weekdays'),
                _InfoRow(label: 'Discipline', value: 'Connection first'),
              ],
            ),
            SizedBox(height: 12),

            // Co-Parent
            _buildProfileCard(
              title: 'Co-Parent',
              rows: [
                _InfoRow(label: 'Status', value: '✦ Connected', valueColor: lunaPurple),
                _InfoRow(label: 'Shared memory', value: 'Enabled'),
              ],
            ),
            SizedBox(height: 12),

            // What Luna knows
            _buildKnowledgeCard(),
            SizedBox(height: 12),

            // Active Frameworks
            _buildFrameworksCard(),
            SizedBox(height: 12),

            // AI Memory Controls
            _buildMemoryControlsCard(),
            SizedBox(height: 12),

            // Privacy Banner
            _buildPrivacyBanner(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard({required String title, required List<_InfoRow> rows}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFDFA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
          SizedBox(height: 12),
          ...rows.map((row) => _buildInfoRow(row.label, row.value, valueColor: row.valueColor)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 13, color: textSoft)),
          Text(value, style: TextStyle(fontSize: 13, color: valueColor ?? textDeep, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildKnowledgeCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(colors: [lilacWash, bgWhite], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What Luna knows about your family', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: lunaPurple)),
          SizedBox(height: 10),
          _knowledgeItem('3 months of conversation history'),
          _knowledgeItem('2 school reports · 1 psychotest uploaded'),
          _knowledgeItem('78 reflections · 14 core memories saved'),
          _knowledgeItem('Patterns: evening overwhelm, perfectionism, transition resistance'),
        ],
      ),
    );
  }

  Widget _knowledgeItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('✦ ', style: TextStyle(fontSize: 10, color: champagneGold)),
          Expanded(child: Text(text, style: TextStyle(fontSize: 12, color: textMuted))),
        ],
      ),
    );
  }

  Widget _buildFrameworksCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFDFA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Active Frameworks', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
          SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: _frameworks.map((f) => Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: paleLilac,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(f, style: TextStyle(fontSize: 10, color: lunaPurple, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
            )).toList(),
          ),
          SizedBox(height: 10),
          Text(
            'Luna uses these frameworks to shape every response. Tap any to learn more or disable.',
            style: TextStyle(fontSize: 11, color: textSoft.withOpacity(0.9), height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildMemoryControlsCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [Color(0xFFFFFFFF), Color(0xFFFFFDFA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Memory Controls', style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep)),
          SizedBox(height: 12),
          ..._memoryControls.map((c) {
            final isDanger = c['danger'] as bool;
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    c['label'] as String,
                    style: TextStyle(fontSize: 13, color: isDanger ? crisisText : textSoft),
                  ),
                  Text(
                    '→',
                    style: TextStyle(fontSize: 16, color: isDanger ? crisisText : textSoft),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPrivacyBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(colors: [nightIndigo, Color(0xFF3D3563)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          Text(
            '"Private. Secure. Yours."',
            style: TextStyle(
              fontFamily: 'DM Serif Display',
              fontStyle: FontStyle.italic,
              fontSize: 19,
              color: bgWarm,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'End-to-end encrypted · You own your data · No public sharing · Transparent AI usage · All recommendations traceable',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: paleLilac.withOpacity(0.9), height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _InfoRow {
  final String label;
  final String value;
  final Color? valueColor;
  _InfoRow({required this.label, required this.value, this.valueColor});
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
