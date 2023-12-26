import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:adept_labz/packages/network/app/entity/user_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'entity/album_photos_response.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @GET("/photos")
  Future<HttpResponse<List<AlbumPhotosResponse>>> getAlbumPhotos(
      @Query("albumId") int id);

  @GET("/albums")
  Future<HttpResponse<List<AlbumsResponse>>> getAlbums(@Query("userId") int id);

  @GET("/comments")
  Future<HttpResponse<List<PostCommentsResponse>>> getPostComments(
      @Query("postId") int id);

  @GET("/posts")
  Future<HttpResponse<List<PostsResponse>>> getPosts(@Query("userId") int id);

  @GET("/users")
  Future<HttpResponse<List<UserResponse>>> getUserDetails(@Query("id") int id);
}
