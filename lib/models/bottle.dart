import 'dart:convert';

import 'package:one_cask/models/tasting_notes.dart';

class Bottle {
  final String id;
  final String name;
  final String year;
  final String cask;
  final String image;
  final BottleDetails details;

  Bottle({
    required this.id,
    required this.name,
    required this.year,
    required this.cask,
    required this.image,
    required this.details,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      id: json['id'],
      name: json['name'],
      year: json['year'],
      cask: json['cask'],
      image: json['image'],
      details: BottleDetails.fromJson(json['details']),
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
