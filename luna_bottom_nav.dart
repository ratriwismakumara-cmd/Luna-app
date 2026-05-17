import 'package:flutter/material.dart';
import 'package:luna/theme.dart';

class LunaBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const LunaBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const _navItems = [
    {'label': 'Diary', 'icon': Icons.book_outlined, 'active': Icons.book},
    {'label': 'Growth', 'icon': Icons.trending_up, 'active': Icons.trending_up},
    {'label': '', 'icon': Icons.auto_awesome, 'active': Icons.auto_awesome}, // Luna
    {
      'label': 'Nutrition',
      'icon': Icons.restaurant_outlined,
      'active': Icons.restaurant,
    },
    {
      'label': 'Profile',
      'icon': Icons.person_outline,
      'active': Icons.person,
    },
  ];

  // All 5 nav items map 1:1 to screen indices
  int _mapIndex(int tappedIndex) => tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      decoration: BoxDecoration(
        color: LunaColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(_navItems.length, (index) {
            final item = _navItems[index];
            final isCenter = index == 2;
            final isSelected = isCenter ? false : index == currentIndex;

            if (isCenter) {
              return _LunaCenterButton(onTap: () => onTap(2));
            }

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: SizedBox(
                width: 64,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isSelected
                          ? item['active'] as IconData
                          : item['icon'] as IconData,
                      size: 22,
                      color: isSelected
                          ? LunaColors.primary
                          : LunaColors.grey,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['label'] as String,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: isSelected
                            ? LunaColors.primary
                            : LunaColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _LunaCenterButton extends StatelessWidget {
  final VoidCallback onTap;

  const _LunaCenterButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform.translate(
        offset: const Offset(0, -12),
        child: Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [LunaColors.mediumPurple, LunaColors.primary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: LunaColors.mediumPurple.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.auto_awesome,
            color: LunaColors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
