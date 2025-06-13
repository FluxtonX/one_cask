class TastingNotes {
  final List<String> nose;
  final List<String> palate;
  final List<String> finish;

  TastingNotes({
    required this.nose,
    required this.palate,
    required this.finish,
  });

  factory TastingNotes.fromJson(Map<String, dynamic> json) {
    return TastingNotes(
      nose: List<String>.from(json['nose']),
      palate: List<String>.from(json['palate']),
      finish: List<String>.from(json['finish']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nose': nose,
      'palate': palate,
      'finish': finish,
    };
  }
}
