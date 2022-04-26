class ArticleModel {
  Source source;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  ArticleModel({
    required this.source,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      title: json['title'] as String?,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson(ArticleModel instance) {
    return <String, dynamic>{
      'source': instance.source,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
    };
  }
}

class Source {
  String? id;
  String? name;

  Source({required this.id, required this.name});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson(Source instance) {
    return <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
  }
}
