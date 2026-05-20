import 'package:flutter/material.dart';

/// LunaDiary — Emotional scrapbook for parenting moments
class LunaDiary extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaDiary({super.key, this.width, this.height});

  @override
  State<LunaDiary> createState() => _LunaDiaryState();
}

class _LunaDiaryState extends State<LunaDiary> {
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
  static const lineFaint = Color(0xFFF0EBF2);

  String _activeFilter = 'All';
  final List<String> _filters = ['All', 'Milestones', 'Bonding', 'Reflection', 'Crisis Recovery', 'Core Memories'];

  final List<Map<String, dynamic>> _entries = [
    {
      'date': 'May',
      'day': '10',
      'title': 'First time they apologized without prompting',
      'desc': 'After a difficult dinner, your child paused, came back 10 minutes later, and said sorry. ✨',
      'mood': '🥹',
      'core': true,
      'filter': 'Core Memories',
    },
    {
      'date': 'May',
      'day': '7',
      'title': 'Swimming breakthrough',
      'desc': 'Coach said they\'re ready for Level 4. Growth isn\'t always loud — sometimes it\'s quiet persistence.',
      'mood': '🏊',
      'core': false,
      'filter': 'Milestones',
    },
    {
      'date': 'May',
      'day': '3',
      'title': 'Sibling moment',
      'desc': '"Look, they\'re learning from me!" — First time taking pride in being the big one.',
      'mood': '💕',
      'core': true,
      'filter': 'Core Memories',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _activeFilter == 'All'
        ? _entries
        : _entries.where((e) => e['filter'] == _activeFilter).toList();

    return Container(
      color: bgWarm,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section header
            Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 4),
              child: _SectionHeader(title: 'Family Diary'),
            ),
            // Subtitle
            Padding(
              padding: EdgeInsets.fromLTRB(24, 4, 24, 8),
              child: Text(
                'An emotional scrapbook — yours, timeless',
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
            // Filters
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: _filters.length,
                separatorBuilder: (_, __) => SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final f = _filters[i];
                  final active = f == _activeFilter;
                  return GestureDetector(
                    onTap: () => setState(() => _activeFilter = f),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: active ? lunaPurple : bgWhite,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: active ? lunaPurple : lineSoft),
                      ),
                      child: Text(
                        f,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: active ? bgWarm : textMuted),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 12),
            // Monthly recap
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [lilacWash, warmCream], begin: Alignment.topLeft, end: Alignment.bottomRight),
              ),
              child: Column(
                children: [
                  Text(
                    '"This month, you showed up — quietly and consistently."',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cormorant Garamond',
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                      color: lunaPurple,
                      fontWeight: FontWeight.w500,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '4 core memories · 12 reflections · 2 breakthroughs',
                    style: TextStyle(fontSize: 12, color: textMuted.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            // Diary entries
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: filtered.map((entry) => _buildMemoryCard(entry)).toList(),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildMemoryCard(Map<String, dynamic> entry) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.fromLTRB(14, 18, 20, 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(
          colors: [bgWhite, Color(0xFFFFFDFA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: lunaPurple.withOpacity(0.07), blurRadius: 26, offset: Offset(0, 10)),
          BoxShadow(color: warmCream.withOpacity(0.5), blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Date column
          Container(
            width: 56,
            padding: EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
              border: Border(right: BorderSide(color: lineFaint)),
            ),
            child: Column(
              children: [
                Text(
                  entry['date'] as String,
                  style: TextStyle(
                    fontFamily: 'Cormorant Garamond',
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: lunaPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  entry['day'] as String,
                  style: TextStyle(
                    fontFamily: 'Cormorant Garamond',
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    color: lunaPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry['title'] as String,
                  style: TextStyle(fontFamily: 'DM Serif Display', fontSize: 18, color: textDeep, height: 1.3),
                ),
                SizedBox(height: 6),
                Text(
                  entry['desc'] as String,
                  style: TextStyle(fontSize: 12, color: textMuted, height: 1.65),
                ),
                if (entry['core'] == true) ...[
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text('★ ', style: TextStyle(fontSize: 12, color: champagneGold)),
                      Text('Core Memory', style: TextStyle(fontSize: 9, color: champagneGold, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
                    ],
                  ),
                ],
              ],
            ),
          ),
          // Mood emoji
          Text(entry['mood'] as String, style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

/// Section header with DM Serif Display + underline accent
class _SectionHeader extends StatelessWidget {
  final String title;
  _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
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
