class NewsArticleModel {
  String? title;
  String? imageUrl;
  String? timestamp;
  String? author;
  String? description;

  NewsArticleModel({
    this.title,
    this.imageUrl,
    this.timestamp,
    this.author,
    this.description,
  });

  NewsArticleModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
    timestamp = json['timestamp'];
    author = json['author'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['imageUrl'] = imageUrl;
    data['timestamp'] = timestamp;
    data['author'] = author;
    data['description'] = description;
    return data;
  }
}
