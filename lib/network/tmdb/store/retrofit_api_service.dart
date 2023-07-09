import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_api_service.g.dart';

@RestApi(baseUrl: 'https://6466f9a32ea3cae8dc22d900.mockapi.io/api/v1/')

/// Responsible for Handling all the Network call
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('tmdb_movies')
  Future<HttpResponse> getRetrofitDetails();

  @GET('tmdb_movies')
  Future<List<TMDBRetrofitModel>> queryResponse(@Query('title') String title);

  @GET('favourite_movies')
  Future<List<TMDBRetrofitModel>> getFavouriteList();

  @GET('tmdb_movies')
  Future<List<TMDBRetrofitModel>> getMoviesUsingMultipleQueries(
      @Queries() Map<String, dynamic> queries);

  @POST('favourite_movies')
  Future<void> pushMovie(
    @Body(nullToAbsent: false) TMDBRetrofitModel movieData,
  );

  @DELETE('favourite_movies/{id}')
  Future<void> deleteMovie(@Path('id') String id);
}

@JsonSerializable()
class TMDBRetrofitModel {
  final String? id;
  final String original_title;
  final String title;
  final String overview;
  final String release_date;
  final String poster_path;

  TMDBRetrofitModel({
    required this.id,
    required this.original_title,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.poster_path,
  });

  factory TMDBRetrofitModel.fromJson(Map<String, dynamic> json) =>
      _$TMDBRetrofitModelFromJson(json);

  Map<String, dynamic> toJson() => _$TMDBRetrofitModelToJson(this);
}
