import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  static const _slides = [
    {
      'icon': Icons.smart_toy_outlined,
      'title': 'Meet Luna',
      'subtitle':
          'Your AI companion that understands the ups and downs of parenting. Luna learns your family\'s rhythm and supports you every step of the way.',
    },
    {
      'icon': Icons.psychology,
      'title': 'Guided by Wisdom',
      'subtitle':
          'Luna draws from Montessori, RIE, Positive Discipline, and more — blending evidence-based frameworks with your unique parenting style.',
    },
    {
      'icon': Icons.favorite_rounded,
      'title': 'Your Journey, Together',
      'subtitle':
          'Track milestones, reflect on moments, get nutrition tips, and find calm in the chaos. You\'re not alone — Luna\'s got your back.',
    },
  ];

  void _goToNext() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/chat');
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacementNamed('/chat');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LunaColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _skip,
                child: Text(
                  'Skip',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: LunaColors.mediumPurple,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return _OnboardingSlide(
                    icon: slide['icon'] as IconData,
                    title: slide['title'] as String,
                    subtitle: slide['subtitle'] as String,
                  );
                },
              ),
            ),
            _buildPageIndicator(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 40),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _goToNext,
                  child: Text(
                    _currentPage == _slides.length - 1
                        ? 'Get Started'
                        : 'Continue',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_slides.length, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? LunaColors.primary : LunaColors.lightPurple,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: LunaColors.cream,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: LunaColors.lightPurple.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              icon,
              size: 60,
              color: LunaColors.mediumPurple,
            ),
          ),
          const SizedBox(height: 48),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: LunaColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 15,
              height: 1.6,
              color: LunaColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
