import 'package:blablagithub/constants/config.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'git_rest_client.g.dart';

@RestApi(baseUrl: Config.GIT_REST_BASE_URL)
abstract class GitRestClient {
  factory GitRestClient(Dio dio, {String baseUrl}) = _GitRestClient;

  @GET('/search/code')
  Future<dynamic> search({
    @Header("Authorization") String authHeader = "Bearer ${Config.GIT_TOKEN}",
    @Query('q') required String query,
    @Query('page') int? page,
  });
}
