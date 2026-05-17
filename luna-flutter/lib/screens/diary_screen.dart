import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/theme.dart';
import 'package:luna/widgets/luna_bottom_nav.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  static final _entries = [
    {
      'date': 'May 15, 2026',
      'title': 'Teething Troubles',
      'preview':
          'Another rough night. Baby Aruna is definitely going through a teething phase. Gums are swollen and she\'s been fussier than usual...',
      'mode': 'Crisis',
      'mood': '😮‍💨',
    },
    {
      'date': 'May 13, 2026',
      'title': 'First Steps!',
      'preview':
          'SHE WALKED! Three wobbly steps from the couch to my arms. I can\'t believe it — our little one is officially mobile. Captured it on video too...',
      'mode': 'Milestone',
      'mood': '🥹',
    },
    {
      'date': 'May 10, 2026',
      'title': 'Quiet Sunday Reflections',
      'preview':
          'Spent the afternoon reading while Aruna napped. Realized I need to be more patient with myself. Parenting isn\'t about perfection...',
      'mode': 'Reflection',
      'mood': '🧘',
    },
    {
      'date': 'May 8, 2026',
      'title': 'Playdate Success',
      'preview':
          'Took Aruna to the park and met with Mira and baby Kian. She shared toys (mostly!) and they parallel-played near the sandbox...',
      'mode': 'Wellness',
      'mood': '😊',
    },
  ];

  void _onNavTap(int index) {
    switch (index) {
      case 0:
        return; // already on diary
      case 1:
        Navigator.pushReplacementNamed(context, '/growth');
        break;
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
          'Diary',
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: LunaColors.textSecondary,
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined),
            onPressed: () {},
            color: LunaColors.textSecondary,
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        itemCount: _entries.length + 1, // +1 for header
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [LunaColors.mediumPurple, LunaColors.primary],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.auto_stories, color: LunaColors.white, size: 28),
                          const SizedBox(height: 12),
                          Text(
                            'This Week',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: LunaColors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '4 Entries',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 22,
                              color: LunaColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: LunaColors.cream,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.emoji_events, color: LunaColors.gold, size: 28),
                          const SizedBox(height: 12),
                          Text(
                            'Streak',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: LunaColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '5 days',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 22,
                              color: LunaColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final entry = _entries[index - 1];
          return _DiaryCard(
            date: entry['date']!,
            title: entry['title']!,
            preview: entry['preview']!,
            mode: entry['mode']!,
            mood: entry['mood']!,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: LunaColors.primary,
        child: const Icon(Icons.add, color: LunaColors.white),
      ),
      bottomNavigationBar: LunaBottomNav(
        currentIndex: 0,
        onTap: _onNavTap,
      ),
    );
  }
}

class _DiaryCard extends StatelessWidget {
  final String date;
  final String title;
  final String preview;
  final String mode;
  final String mood;

  const _DiaryCard({
    required this.date,
    required this.title,
    required this.preview,
    required this.mode,
    required this.mood,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
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
              Text(mood, style: const TextStyle(fontSize: 18)),
              const SizedBox(width: 8),
              Text(
                date,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: LunaColors.grey,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: LunaColors.lightPurple.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  mode,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: LunaColors.mediumPurple,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 18,
              color: LunaColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            preview,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.5,
              color: LunaColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 20),
                onPressed: () {},
                color: LunaColors.grey,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.share_outlined, size: 20),
                onPressed: () {},
                color: LunaColors.grey,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
