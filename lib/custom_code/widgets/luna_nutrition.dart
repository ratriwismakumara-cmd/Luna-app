// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class LunaNutrition extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaNutrition({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    final purple = Color(0xFF2B2447);
    final lavender = Color(0xFF6B5FA6);
    final soft = Color(0xFFB9A7D9);
    final gold = Color(0xFFD8B67A);
    final cream = Color(0xFFF7EAD6);
    return Container(
        color: cream,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Nutrition',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: purple)),
              SizedBox(height: 4),
              Text('Fuel for growing bodies',
                  style: TextStyle(fontSize: 14, color: lavender)),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [lavender, purple]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Activity Today',
                            style: TextStyle(fontSize: 13, color: soft)),
                        Row(children: [
                          Text('Medium',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Spacer(),
                          Text('~1,400 kcal',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: gold)),
                        ]),
                      ])),
              SizedBox(height: 20),
              _meal('🥣', 'Breakfast', 'Oatmeal + banana', '320 kcal'),
              _meal('🍱', 'Lunch', 'Rice + chicken + veggies', '520 kcal'),
              _meal('🍎', 'Snack', 'Apple + yogurt', '180 kcal'),
              _meal('🍲', 'Dinner', 'Chicken soup', '380 kcal'),
            ])));
  }

  Widget _meal(String emoji, String meal, String food, String kcal) {
    return Card(
        elevation: 0,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: ListTile(
            leading: Text(emoji, style: TextStyle(fontSize: 28)),
            title: Text('$meal: $food', style: TextStyle(fontSize: 14)),
            subtitle: Text(kcal, style: TextStyle(color: Color(0xFF6B5FA6)))));
  }
}
