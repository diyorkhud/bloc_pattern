import 'dart:convert';
import 'package:bloc2_pattern/model/comment_model.dart';
import 'package:bloc2_pattern/model/photo_model.dart';
import 'package:http/http.dart';
import '../model/post_model.dart';
import 'log_service.dart';

class Network {
  static String BASE = "jsonplaceholder.typicode.com";
  //static String BASE = "64342c25582420e23175cc16.mockapi.io";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  // static String API_LIST = "/books";
  // static String API_CREATE = "/books";
  // static String API_UPDATE = "/books/"; //{id}
  // static String API_DELETE = "/books/"; //{id}


  static String API_LIST = "/posts";
  static String API_COMMENTS_LIST = "/posts/1/comments";
  static String API_PHOTOS_LIST = "/albums/1/photos";
  static String API_CREATE = "/posts";
  static String API_UPDATE = "/posts/"; //{id}
  static String API_DELETE = "/posts/"; //{id}

  /* Http Requests */

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    LogService.i(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    LogService.i(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    LogService.i(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    LogService.i(response.body);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'id': post.id.toString(),
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString(),
    });
    return params;
  }

  /* Http Parsing */

  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }

  static List<Comment> parseCommentList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Comment>.from(json.map((x) => Comment.fromJson(x)));
    return data;
  }

  static List<Photo> parsePhotoList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Photo>.from(json.map((x) => Photo.fromJson(x)));
    return data;
  }

  static Post parsePost(String response) {
    dynamic json = jsonDecode(response);
    return Post.fromJson(json);
  }
}