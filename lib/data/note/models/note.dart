import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final String userEmail;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.userEmail,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      userEmail: data['userEmail'] ?? '',
      createdAt: _convertTimestamp(data['createdAt']),
      updatedAt: _convertTimestamp(data['updatedAt']),
    );
  }

  static Timestamp _convertTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp;
    } else if (timestamp is String) {
      DateTime dateTime = DateTime.parse(timestamp);
      return Timestamp.fromDate(dateTime);
    }
    return Timestamp.now();
  }
}
