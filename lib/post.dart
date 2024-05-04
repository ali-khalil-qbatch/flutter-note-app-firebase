import 'dart:convert'; // required to encode/decode json data
import 'package:http/http.dart' as http;

class Post {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Post({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Post.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response = await http.get(url, headers: {
      "Content-Type": "application/json",
    });
    final List body = json.decode(response.body);
    // await Future.delayed(const Duration(seconds: 1));
    return body.map((e) => Post.fromJson(e)).toList();
  }
}
