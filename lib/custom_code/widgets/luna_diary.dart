// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LunaDiary extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaDiary({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final purple = Color(0xFF2B2447);
    final lavender = Color(0xFF6B5FA6);
    final soft = Color(0xFFB9A7D9);
    final gold = Color(0xFFD8B67A);
    final cream = Color(0xFFF7EAD6);
    final entries = [
      {
        'mood': '🤗',
        'title': 'Morning snuggles breakthrough',
        'mode': 'Bonding',
        'date': 'Today · 9:30 AM'
      },
      {
        'mood': '😌',
        'title': 'Bedtime without tears',
        'mode': 'Milestone',
        'date': 'Yesterday · 8:15 PM'
      },
      {
        'mood': '😔',
        'title': 'Tough afternoon meltdown',
        'mode': 'Crisis',
        'date': 'May 16 · 3:40 PM'
      },
    ];
    return Container(
        color: cream,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Your Diary',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: purple)),
              SizedBox(height: 4),
              Text('A record of your parenting journey',
                  style: TextStyle(fontSize: 14, color: lavender)),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [purple, lavender]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('This Week',
                              style: TextStyle(fontSize: 14, color: soft)),
                          Text('5 entries',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text('4-day streak 🔥',
                              style: TextStyle(fontSize: 14, color: soft)),
                        ]),
                    Spacer(),
                    Icon(Icons.auto_stories, size: 48, color: gold),
                  ])),
              SizedBox(height: 20),
              ...entries.map((e) => Card(
                  elevation: 0,
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(e['mood']!, style: TextStyle(fontSize: 20)),
                              SizedBox(width: 8),
                              Text(e['title']!,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: purple))
                            ]),
                            SizedBox(height: 8),
                            Wrap(spacing: 4, children: [
                              Chip(
                                  label: Text(e['mode']!,
                                      style: TextStyle(fontSize: 10)),
                                  backgroundColor: soft.withOpacity(0.2),
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  padding: EdgeInsets.zero),
                              Text('  ${e['date']}',
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                            ]),
                          ])))),
            ])));
  }
}
