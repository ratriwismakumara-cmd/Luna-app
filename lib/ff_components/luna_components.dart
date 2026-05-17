/// FlutterFlow-compatible component registry for Luna
/// All custom widgets are registered here for FlutterFlow to use as Custom Widgets

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';
import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/diary_screen.dart';
import '../screens/growth_screen.dart';
import '../screens/nutrition_screen.dart';
import '../screens/profile_screen.dart';
import '../widgets/luna_bottom_nav.dart';
import '../widgets/message_bubble.dart';
import '../widgets/mode_chip.dart';
import '../widgets/input_bar.dart';
import '../widgets/framework_chip.dart';

// Each component wrapped as a standalone widget FlutterFlow can embed
class LunaSplashComponent extends StatelessWidget {
  const LunaSplashComponent({super.key});
  @override
  Widget build(BuildContext context) => const SplashScreen();
}

class LunaOnboardingComponent extends StatelessWidget {
  const LunaOnboardingComponent({super.key});
  @override
  Widget build(BuildContext context) => const OnboardingScreen();
}

class LunaChatComponent extends StatelessWidget {
  const LunaChatComponent({super.key});
  @override
  Widget build(BuildContext context) => const ChatScreen();
}

class LunaDiaryComponent extends StatelessWidget {
  const LunaDiaryComponent({super.key});
  @override
  Widget build(BuildContext context) => const DiaryScreen();
}

class LunaGrowthComponent extends StatelessWidget {
  const LunaGrowthComponent({super.key});
  @override
  Widget build(BuildContext context) => const GrowthScreen();
}

class LunaNutritionComponent extends StatelessWidget {
  const LunaNutritionComponent({super.key});
  @override
  Widget build(BuildContext context) => const NutritionScreen();
}

class LunaProfileComponent extends StatelessWidget {
  const LunaProfileComponent({super.key});
  @override
  Widget build(BuildContext context) => const ProfileScreen();
}
