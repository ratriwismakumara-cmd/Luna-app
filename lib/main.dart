import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:luna/screens/chat_screen.dart';
import 'package:luna/screens/diary_screen.dart';
import 'package:luna/screens/growth_screen.dart';
import 'package:luna/screens/nutrition_screen.dart';
import 'package:luna/screens/onboarding_screen.dart';
import 'package:luna/screens/profile_screen.dart';
import 'package:luna/screens/splash_screen.dart';
import 'package:luna/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock to 390×844 viewport (iPhone 14 dimensions)
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const LunaApp());
}

class LunaApp extends StatelessWidget {
  const LunaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luna — AI Parenting Companion',
      debugShowCheckedModeBanner: false,
      theme: LunaTheme.theme,
      initialRoute: '/splash',
      onGenerateRoute: (settings) {
        // Scale all routes to 390×844 if not already constrained
        return MaterialPageRoute(
          builder: (context) {
            return _DeviceFrame(
              child: _buildRoute(settings),
            );
          },
        );
      },
    );
  }

  Widget _buildRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return const SplashScreen();
      case '/onboarding':
        return const OnboardingScreen();
      case '/chat':
        return const ChatScreen();
      case '/diary':
        return const DiaryScreen();
      case '/growth':
        return const GrowthScreen();
      case '/nutrition':
        return const NutritionScreen();
      case '/profile':
        return const ProfileScreen();
      default:
        return const SplashScreen();
    }
  }
}

/// Wraps content in a 390×844 viewport frame for consistent rendering.
/// On larger screens, centers the content with a subtle background.
class _DeviceFrame extends StatelessWidget {
  final Widget child;
  const _DeviceFrame({required this.child});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    if (screenSize.width <= 390 && screenSize.height <= 844) {
      return child;
    }

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Container(
          width: 390,
          height: 844,
          decoration: BoxDecoration(
            color: LunaColors.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              size: const Size(390, 844),
              padding: EdgeInsets.zero,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
