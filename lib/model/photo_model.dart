class Photo{
  int? id;
  String? url;
  String? thumbnailUrl;
  String? title;
  int? albumId;

  Photo({this.id, this.url, this.title, this.thumbnailUrl, this.albumId});

  Photo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'],
        title = json['title'],
        albumId = json['albumId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
    'title': title,
    'albumId': albumId,
  };
}