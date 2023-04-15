class Comment{
  int? id;
  String? email;
  String? name;
  String? body;
  int? postId;

  Comment({this.id, this.email, this.body, this.name, this.postId});

  Comment.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        email = json['email'],
        body = json['body'],
        name = json['name'],
        postId = json['postId'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'body': body,
    'name': name,
    'postId': postId,
  };
}