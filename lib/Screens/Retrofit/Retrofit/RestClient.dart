import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'RestClient.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/topstories.json')
  Future<List<int>> getTopNews();

  @GET('/item/{id}.json')
  Future<News> getNewsDetail({@Path() int id});
}

@JsonSerializable()
class News {
  int id;
  String title;
  String type;
  String url;

  News({
    this.id,
    this.title,
    this.type,
    this.url,
});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
