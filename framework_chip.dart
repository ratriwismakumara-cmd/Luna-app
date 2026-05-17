import 'package:flutter/material.dart';
import 'package:luna/theme.dart';

class FrameworkChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const FrameworkChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: isActive
              ? const LinearGradient(
                  colors: [LunaColors.primary, LunaColors.mediumPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isActive ? null : LunaColors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive ? LunaColors.primary : LunaColors.lightPurple,
            width: 1.2,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: LunaColors.mediumPurple.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? LunaColors.white : LunaColors.mediumPurple,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isActive ? LunaColors.white : LunaColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FrameworkChipGrid extends StatelessWidget {
  final Set<String> activeFrameworks;
  final Function(String) onToggle;

  const FrameworkChipGrid({
    super.key,
    required this.activeFrameworks,
    required this.onToggle,
  });

  static const _frameworks = [
    {'label': 'Montessori', 'icon': Icons.auto_awesome},
    {'label': 'RIE', 'icon': Icons.child_care},
    {'label': 'Positive Discipline', 'icon': Icons.thumb_up_alt},
    {'label': 'Gentle Parenting', 'icon': Icons.waving_hand},
    {'label': 'Attachment', 'icon': Icons.link},
    {'label': 'Authoritative', 'icon': Icons.balance},
    {'label': 'Conscious', 'icon': Icons.self_improvement},
    {'label': 'Waldorf', 'icon': Icons.forest},
    {'label': 'Emotion Coaching', 'icon': Icons.mood},
    {'label': 'Pikler', 'icon': Icons.toys},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: _frameworks.map((f) {
        final label = f['label'] as String;
        return FrameworkChip(
          label: label,
          icon: f['icon'] as IconData,
          isActive: activeFrameworks.contains(label),
          onTap: () => onToggle(label),
        );
      }).toList(),
    );
  }
}
