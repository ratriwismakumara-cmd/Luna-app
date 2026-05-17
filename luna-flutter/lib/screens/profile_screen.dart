import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luna/theme.dart';
import 'package:luna/widgets/framework_chip.dart';
import 'package:luna/widgets/luna_bottom_nav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Set<String> _activeFrameworks = {
    'Positive Discipline',
    'Gentle Parenting',
    'RIE',
  };

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
        Navigator.pushReplacementNamed(context, '/nutrition');
        break;
      case 4:
        return; // already on profile
    }
  }

  void _toggleFramework(String label) {
    setState(() {
      if (_activeFrameworks.contains(label)) {
        _activeFrameworks.remove(label);
      } else {
        _activeFrameworks.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LunaColors.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.dmSerifDisplay(fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {},
            color: LunaColors.textSecondary,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // User profile card
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LunaColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                // Avatar
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [LunaColors.lightPurple, LunaColors.mediumPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: LunaColors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Ratri Vibhuti',
                  style: GoogleFonts.dmSerifDisplay(
                    fontSize: 22,
                    color: LunaColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mom to Aruna • 14 months',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: LunaColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _ProfileStat(label: 'Entries', value: '47'),
                    const SizedBox(width: 32),
                    Container(width: 1, height: 32, color: LunaColors.lightPurple),
                    const SizedBox(width: 32),
                    _ProfileStat(label: 'Streak', value: '5d'),
                    const SizedBox(width: 32),
                    Container(width: 1, height: 32, color: LunaColors.lightPurple),
                    const SizedBox(width: 32),
                    _ProfileStat(label: 'Moods', value: '12'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Baby profile
          Text(
            'Baby Profile',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: LunaColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _ProfileRow(
                  icon: Icons.child_care,
                  label: 'Name',
                  value: 'Aruna',
                ),
                const Divider(height: 24, color: LunaColors.lightGrey),
                _ProfileRow(
                  icon: Icons.cake,
                  label: 'Birth Date',
                  value: 'March 12, 2025',
                ),
                const Divider(height: 24, color: LunaColors.lightGrey),
                _ProfileRow(
                  icon: Icons.wc,
                  label: 'Gender',
                  value: 'Female',
                ),
                const Divider(height: 24, color: LunaColors.lightGrey),
                _ProfileRow(
                  icon: Icons.bloodtype,
                  label: 'Blood Type',
                  value: 'B+',
                ),
                const Divider(height: 24, color: LunaColors.lightGrey),
                _ProfileRow(
                  icon: Icons.local_hospital,
                  label: 'Pediatrician',
                  value: 'Dr. Maya Kesuma',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Parenting frameworks
          Text(
            'Your Parenting Frameworks',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 4),
          Text(
            'Luna adapts to your preferred approaches',
            style: GoogleFonts.inter(fontSize: 13, color: LunaColors.grey),
          ),
          const SizedBox(height: 14),
          FrameworkChipGrid(
            activeFrameworks: _activeFrameworks,
            onToggle: _toggleFramework,
          ),
          const SizedBox(height: 24),

          // App settings
          Text(
            'App Settings',
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: LunaColors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _SettingsTile(
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  trailing: Switch(
                    value: true,
                    onChanged: (_) {},
                    activeColor: LunaColors.mediumPurple,
                  ),
                ),
                const Divider(height: 1, indent: 60, color: LunaColors.lightGrey),
                _SettingsTile(
                  icon: Icons.dark_mode_outlined,
                  title: 'Dark Mode',
                  trailing: Switch(
                    value: false,
                    onChanged: (_) {},
                    activeColor: LunaColors.mediumPurple,
                  ),
                ),
                const Divider(height: 1, indent: 60, color: LunaColors.lightGrey),
                _SettingsTile(
                  icon: Icons.lock_outline,
                  title: 'Privacy & Data',
                  trailing: const Icon(Icons.chevron_right, color: LunaColors.grey),
                ),
                const Divider(height: 1, indent: 60, color: LunaColors.lightGrey),
                _SettingsTile(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  trailing: const Icon(Icons.chevron_right, color: LunaColors.grey),
                ),
                const Divider(height: 1, indent: 60, color: LunaColors.lightGrey),
                _SettingsTile(
                  icon: Icons.info_outline,
                  title: 'About Luna',
                  trailing: Text(
                    'v1.0.0',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: LunaColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
      bottomNavigationBar: LunaBottomNav(
        currentIndex: 4,
        onTap: _onNavTap,
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 20,
            color: LunaColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 12, color: LunaColors.grey),
        ),
      ],
    );
  }
}

class _ProfileRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProfileRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: LunaColors.lightPurple.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 18, color: LunaColors.mediumPurple),
        ),
        const SizedBox(width: 14),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            color: LunaColors.textSecondary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: LunaColors.textPrimary,
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 22, color: LunaColors.mediumPurple),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: LunaColors.textPrimary,
              ),
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
