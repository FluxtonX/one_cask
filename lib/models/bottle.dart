import 'dart:convert';

class Bottle {
  final String id;
  final String name;
  final String year;
  final String cask;
  final String image;
  final BottleDetails details;
  final String distillery;
  final String region;
  final String country;
  final String type;
  final String ageStatement;
  final String filled;
  final String bottled;
  final String caskNumber;
  final String abv;
  final String size;
  final String finish;
  final List<HistoryEntry> history;

  Bottle({
    required this.id,
    required this.name,
    required this.year,
    required this.cask,
    required this.image,
    required this.details,
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.ageStatement,
    required this.filled,
    required this.bottled,
    required this.caskNumber,
    required this.abv,
    required this.size,
    required this.finish,
    required this.history,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      cask: json['cask'],
      image: json['image'],
      details: BottleDetails.fromJson(json['details']),
      distillery: json['distillery'] ?? '',
      region: json['region'] ?? '',
      country: json['country'] ?? '',
      type: json['type'] ?? '',
      ageStatement: json['ageStatement'] ?? '',
      filled: json['filled'] ?? '',
      bottled: json['bottled'] ?? '',
      caskNumber: json['caskNumber'] ?? '',
      abv: json['abv'] ?? '',
      size: json['size'] ?? '',
      finish: json['finish'] ?? '',
      history: (json['history'] as List<dynamic>?)
              ?.map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'year': year,
      'cask': cask,
      'image': image,
      'details': jsonEncode(details.toMap()),
      'distillery': distillery,
      'region': region,
      'country': country,
      'type': type,
      'ageStatement': ageStatement,
      'filled': filled,
      'bottled': bottled,
      'caskNumber': caskNumber,
      'abv': abv,
      'size': size,
      'finish': finish,
      'history': jsonEncode(history.map((e) => e.toMap()).toList()),
    };
  }

  factory Bottle.fromMap(Map<String, dynamic> map) {
    return Bottle(
      id: map['id'],
      name: map['name'],
      year: map['year'],
      cask: map['cask'],
      image: map['image'],
      details: BottleDetails.fromJson(jsonDecode(map['details'])),
      distillery: map['distillery'] ?? '',
      region: map['region'] ?? '',
      country: map['country'] ?? '',
      type: map['type'] ?? '',
      ageStatement: map['ageStatement'] ?? '',
      filled: map['filled'] ?? '',
      bottled: map['bottled'] ?? '',
      caskNumber: map['caskNumber'] ?? '',
      abv: map['abv'] ?? '',
      size: map['size'] ?? '',
      finish: map['finish'] ?? '',
      history: (jsonDecode(map['history']) as List<dynamic>)
          .map((e) => HistoryEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class BottleDetails {
  final String bottle;
  final String type;
  final String number;
  final TastingNotes tastingNotes;

  BottleDetails({
    required this.bottle,
    required this.type,
    required this.number,
    required this.tastingNotes,
  });

  factory BottleDetails.fromJson(Map<String, dynamic> json) {
    return BottleDetails(
      bottle: json['bottle'],
      type: json['type'],
      number: json['number'],
      tastingNotes: TastingNotes.fromJson(json['tastingNotes']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bottle': bottle,
      'type': type,
      'number': number,
      'tastingNotes': tastingNotes.toMap(),
    };
  }
}

class TastingNotes {
  final List<String> nose;
  final List<String> palate;
  final List<String> finish;
  final List<String> yourNose;
  final List<String> yourPalate;
  final List<String> yourFinish;

  TastingNotes({
    required this.nose,
    required this.palate,
    required this.finish,
    required this.yourNose,
    required this.yourPalate,
    required this.yourFinish,
  });

  factory TastingNotes.fromJson(Map<String, dynamic> json) {
    return TastingNotes(
      nose: List<String>.from(json['nose'] ?? []),
      palate: List<String>.from(json['palate'] ?? []),
      finish: List<String>.from(json['finish'] ?? []),
      yourNose: List<String>.from(json['yourNose'] ?? []),
      yourPalate: List<String>.from(json['yourPalate'] ?? []),
      yourFinish: List<String>.from(json['yourFinish'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nose': nose,
      'palate': palate,
      'finish': finish,
      'yourNose': yourNose,
      'yourPalate': yourPalate,
      'yourFinish': yourFinish,
    };
  }
}

class HistoryEntry {
  final String title;
  final String description;
  final List<String> attachments;

  HistoryEntry({
    required this.title,
    required this.description,
    required this.attachments,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      attachments: List<String>.from(json['attachments'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'attachments': attachments,
    };
  }
}
