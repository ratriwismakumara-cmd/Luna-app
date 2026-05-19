// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LunaChat extends StatefulWidget {
  final double? width;
  final double? height;
  const LunaChat({super.key, this.width, this.height});
  @override
  State<LunaChat> createState() => _LunaChatState();
}

class _LunaChatState extends State<LunaChat> {
  final lavender = Color(0xFF6B5FA6);
  final purple = Color(0xFF2B2447);
  final cream = Color(0xFFF7EAD6);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: cream,
        child: Column(children: [
          Container(
              height: 48,
              color: Colors.white,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  children: [
                    'Crisis',
                    'Reflection',
                    'Milestone',
                    'Bonding',
                    'Wellness',
                    'Observation'
                  ]
                      .map((m) => Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ActionChip(
                              label: Text(m, style: TextStyle(fontSize: 11)),
                              backgroundColor:
                                  Color(0xFFB9A7D9).withOpacity(0.15),
                              side: BorderSide.none,
                              onPressed: () {})))
                      .toList())),
          Expanded(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                Text('🌙', style: TextStyle(fontSize: 56)),
                SizedBox(height: 16),
                Text('Hi! I\'m Luna.',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: purple)),
                SizedBox(height: 8),
                Text('How can I support you today?',
                    style: TextStyle(fontSize: 16, color: lavender)),
              ]))),
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: Row(children: [
                IconButton(
                    icon: Icon(Icons.mic, color: lavender), onPressed: () {}),
                Expanded(
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Share your thoughts...',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide.none),
                            fillColor: cream,
                            filled: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16)))),
                SizedBox(width: 6),
                CircleAvatar(
                    backgroundColor: purple,
                    radius: 20,
                    child: Icon(Icons.send, color: Colors.white, size: 16)),
              ])),
        ]));
  }
}
