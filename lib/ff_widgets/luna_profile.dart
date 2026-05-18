class LunaProfile extends StatelessWidget {
  final double? width;
  final double? height;
  const LunaProfile({super.key, this.width, this.height});
  
  @override
  Widget build(BuildContext context) {
    final purple = Color(0xFF2B2447);
    final lavender = Color(0xFF6B5FA6);
    final soft = Color(0xFFB9A7D9);
    final cream = Color(0xFFF7EAD6);
    final frameworks = ['Whole-Brain Child','Emotion Coaching','No-Drama Discipline','Gardener Philosophy','CASEL/SEL','IB Learner Profile','Polyvagal-informed','Ellyn Satter','Orchid & Dandelion','Visible Learning'];
    return Container(color: cream, child: SingleChildScrollView(padding: EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Profile', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 16),
      Container(padding: EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)), child: Row(children: [
        CircleAvatar(radius: 30, backgroundColor: lavender, child: Text('R', style: TextStyle(fontSize: 24, color: Colors.white))),
        SizedBox(width: 14),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Parent Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: purple)), Text('1 child · Khaila, 8yo', style: TextStyle(fontSize: 12, color: lavender))]),
      ])),
      SizedBox(height: 20),
      Text('Active Frameworks', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 10),
      Wrap(spacing: 6, runSpacing: 6, children: frameworks.map((f) => Chip(label: Text(f, style: TextStyle(fontSize: 11)), backgroundColor: soft.withOpacity(0.15), side: BorderSide.none)).toList()),
      SizedBox(height: 20),
      Text('AI Memory Controls', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: purple)),
      SizedBox(height: 10),
      Wrap(spacing: 8, children: ['Edit','Forget','Consent','Co-Parent','Export','Delete'].map((a) => ActionChip(avatar: Icon(Icons.shield_outlined, size: 16, color: lavender), label: Text(a, style: TextStyle(fontSize: 12)), backgroundColor: Colors.white, side: BorderSide(color: soft.withOpacity(0.2)), onPressed: (){})).toList()),
    ])));
  }
}
