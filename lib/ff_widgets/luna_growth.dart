class LunaGrowth extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaGrowth({super.key, this.width, this.height});
  
  @override
  Widget build(BuildContext context) {
    final purple = Color(0xFF2B2447);
    final lavender = Color(0xFF6B5FA6);
    final gold = Color(0xFFD8B67A);
    final cream = Color(0xFFF7EAD6);
    return Container(color: cream, child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Growth', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 4),
      Text('Track every milestone', style: TextStyle(fontSize: 14, color: lavender)),
      SizedBox(height: 20),
      Row(children: [
        _card('Weight', '18.5 kg', '75th %ile', '👁 Luna', purple),
        SizedBox(width: 12),
        _card('Height', '112 cm', '80th %ile', '📝 Parent', gold),
      ]),
      SizedBox(height: 12),
      Row(children: [
        _card('Language', '1200+ words', 'Above avg', '📊 Assess.', lavender),
        SizedBox(width: 12),
        _card('Social', 'Cooperative', 'On track', '🏫 School', Color(0xFFB9A7D9)),
      ]),
      SizedBox(height: 24),
      Text('Milestones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 12),
      _milestone('Walking independently', true, '12 months', gold),
      _milestone('First full sentence', true, '22 months', gold),
      _milestone('Counting to 10', true, '36 months', gold),
      _milestone('Reading simple words', false, 'Expected 48 months', gold),
    ])));
  }
  Widget _card(String label, String value, String sub, String source, Color accent) {
    return Expanded(child: Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])), SizedBox(height: 4),
      Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 2),
      Text(sub, style: TextStyle(fontSize: 12, color: accent, fontWeight: FontWeight.w600)), SizedBox(height: 6),
      Text(source, style: TextStyle(fontSize: 10, color: Colors.grey)),
    ])));
  }
  Widget _milestone(String name, bool ok, String note, Color accent) {
    return Card(elevation: 0, color: Colors.white, margin: EdgeInsets.only(bottom: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), child: ListTile(
      leading: Icon(ok ? Icons.check_circle : Icons.circle_outlined, color: ok ? accent : Colors.grey[400]),
      title: Text(name, style: TextStyle(fontSize: 14)), subtitle: Text(note, style: TextStyle(fontSize: 11, color: Colors.grey)),
    ));
  }
}
