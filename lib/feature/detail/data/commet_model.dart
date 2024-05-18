import '../../../core/entities/comment.dart';

class CommentModel extends Comments {
  CommentModel(
      {required super.postId,
      required super.id,
      required super.name,
      required super.email,
      required super.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
