class NewsModel {
  final int id;
  final String title;
  final String description;
  final String body;
  final String image;
  final DateTime publishedAt;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.body,
    required this.image,
    required this.publishedAt,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      body: json['body'] ?? '',
      image: json['image'] ?? '',
      publishedAt: DateTime.tryParse(json['published_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'body': body,
      'image': image,
      'published_at': publishedAt.toIso8601String(),
    };
  }
}