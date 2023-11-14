import 'package:cloud_firestore/cloud_firestore.dart';

class News {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String body;
  final String reportNumber;
  final Timestamp date;

  News(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.imageUrl,
      required this.body,
      required this.reportNumber,
      required this.date});

  factory News.fromJson(String id, Map<String, dynamic> json) {
    return News(
      id: id,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['imageUrl'] as String,
      body: json['body'] as String,
      reportNumber: json['reportNumber'] as String,
      date: json['date']
    );
  }

  @override
  String toString() {
    return 'News { '
        'id: $id, '
        'title: $title, '
        'subtitle: $subtitle, '
        'imageUrl: $imageUrl, '
        'body: $body, '
        'reportNumber: $reportNumber, '
        'date: $date '
        '}';
  }
}
