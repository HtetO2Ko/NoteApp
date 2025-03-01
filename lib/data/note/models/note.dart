import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final String id;
  final String title;
  final String description;
  final String userEmail;
  final Timestamp createdAt;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.userEmail,
    required this.createdAt,
  });

  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      userEmail: data['userEmail'] ?? '',
      createdAt: _convertTimestamp(data['createdAt']),
    );
  }

  static Timestamp _convertTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp; // Already a Firestore Timestamp
    } else if (timestamp is String) {
      DateTime dateTime = DateTime.parse(timestamp);
      return Timestamp.fromDate(dateTime);
    }
    return Timestamp.now(); // Default if missing
  }
}
