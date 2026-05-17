class LunaMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? mode;

  LunaMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.mode,
  });

  static List<LunaMessage> sampleMessages() {
    return [
      LunaMessage(
        id: '1',
        text:
            'Hai! Aku Luna, AI Parenting Companion kamu. Gimana kabarnya hari ini? ❤️',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        mode: 'Wellness',
      ),
      LunaMessage(
        id: '2',
        text: 'Lagi capek banget deh. Si kecil rewel terus dari semalam 😮‍💨',
        isUser: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      LunaMessage(
        id: '3',
        text:
            'Wah, pasti melelahkan ya. Malam-malam seperti itu memang menguras tenaga. Boleh aku tanya, ada perubahan rutinitas atau mungkin si kecil sedang tumbuh gigi?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
        mode: 'Reflection',
      ),
      LunaMessage(
        id: '4',
        text: 'Iya sih, kayaknya lagi tumbuh gigi. Gusi bawahnya bengkak.',
        isUser: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
      ),
      LunaMessage(
        id: '5',
        text:
            'Ah, teething! 🦷 Ini memang fase yang challenging. Coba beberapa tips ini ya:\n\n• Pijat gusi pelan-pelan dengan jari bersih\n• Berikan teether yang sudah didinginkan (bukan beku)\n• Pelukan ekstra dan ASI/susu lebih sering\n• Kalau sangat tidak nyaman, konsultasikan dengan dokter anak untuk opsi pereda nyeri\n\nIni fase sementara — kamu hebat kok melewati ini! 💜',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
        mode: 'Bonding',
      ),
    ];
  }
}
