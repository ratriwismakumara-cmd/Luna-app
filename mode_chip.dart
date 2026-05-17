import 'package:flutter/material.dart';
import 'package:luna/theme.dart';

class ModeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const ModeChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? LunaColors.primary : LunaColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? LunaColors.primary : LunaColors.lightPurple,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: LunaColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected ? LunaColors.white : LunaColors.mediumPurple,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? LunaColors.white : LunaColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModeChipRow extends StatefulWidget {
  final Function(String) onModeSelected;
  final String? selectedMode;

  const ModeChipRow({
    super.key,
    required this.onModeSelected,
    this.selectedMode,
  });

  @override
  State<ModeChipRow> createState() => _ModeChipRowState();
}

class _ModeChipRowState extends State<ModeChipRow> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedMode;
  }

  static const _modes = [
    {'label': 'Crisis', 'icon': Icons.warning_amber_rounded},
    {'label': 'Reflection', 'icon': Icons.psychology},
    {'label': 'Milestone', 'icon': Icons.emoji_events},
    {'label': 'Bonding', 'icon': Icons.favorite},
    {'label': 'Wellness', 'icon': Icons.spa},
    {'label': 'Observation', 'icon': Icons.visibility},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _modes.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final mode = _modes[index];
          return ModeChip(
            label: mode['label'] as String,
            icon: mode['icon'] as IconData,
            isSelected: _selected == mode['label'],
            onTap: () {
              setState(() {
                _selected = mode['label'];
              });
              widget.onModeSelected(mode['label'] as String);
            },
          );
        },
      ),
    );
  }
}
