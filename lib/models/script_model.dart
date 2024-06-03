import 'package:timezone/browser.dart';

class Script {
  final String id;
  final String name;
  final String description;
  final DateTime  timetask;
  final List<String> commands;
  final bool status;
  final String operationalSystem;

  Script(
      {required this.id,
      required this.name,
      required this.description,
      required this.timetask,
      required this.commands,
      required this.status,
      required this.operationalSystem});

  factory Script.fromMap(Map<String, dynamic> map) {
    return Script(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        timetask: map['timetask'],
        commands: map['commands'],
        status: map['status'],
        operationalSystem: map['operationalSystem']);
  }
}
