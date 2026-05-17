import 'package:flutter/material.dart';
import 'package:luna/theme.dart';

class LunaInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onMic;
  final VoidCallback onCamera;
  final VoidCallback onSave;
  final bool showSaveIndicator;

  const LunaInputBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onMic,
    required this.onCamera,
    required this.onSave,
    this.showSaveIndicator = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showSaveIndicator)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            color: LunaColors.cream.withOpacity(0.5),
            child: Row(
              children: [
                const Icon(
                  Icons.arrow_forward,
                  size: 14,
                  color: LunaColors.gold,
                ),
                const SizedBox(width: 6),
                Text(
                  'Save to: Diary →',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: LunaColors.mediumPurple,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onSave,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: LunaColors.gold,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: LunaColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: LunaColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Row(
              children: [
                _IconButton(
                  icon: Icons.mic_none,
                  onTap: onMic,
                  color: LunaColors.mediumPurple,
                ),
                _IconButton(
                  icon: Icons.camera_alt_outlined,
                  onTap: onCamera,
                  color: LunaColors.mediumPurple,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: TextField(
                    controller: controller,
                    maxLines: 4,
                    minLines: 1,
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Tulis pesan ke Luna...',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      filled: true,
                      fillColor: LunaColors.lightGrey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: const BorderSide(
                          color: LunaColors.mediumPurple,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                _IconButton(
                  icon: Icons.send_rounded,
                  onTap: onSend,
                  color: LunaColors.primary,
                  background: LunaColors.primary,
                  iconColor: LunaColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final Color? background;
  final Color? iconColor;

  const _IconButton({
    required this.icon,
    required this.onTap,
    required this.color,
    this.background,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background ?? Colors.transparent,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 22, color: iconColor ?? color),
        ),
      ),
    );
  }
}
