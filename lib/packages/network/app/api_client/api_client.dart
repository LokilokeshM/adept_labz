import 'package:adept_labz/packages/network/app/entity/album_photos_response.dart';
import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:adept_labz/packages/network/app/entity/user_response.dart';
import 'package:adept_labz/packages/network/entity/common_response.dart';
import 'package:dio/dio.dart';
import '../../../network/api_basic.dart';
import '../../../network/api_config.dart';
import '../app_api.dart';

import './app_client.dart';

class AppAPIClient extends AppClient with APIBasic {
  Dio _getAppDio() {
    final dio = getDio();
    return dio;
  }

  AppApis getApi() => AppApis(
        _getAppDio(),
        baseUrl: ApiConfig.apiBaseUrl,
      );

  @override
  Future<CommonResponse<List<AlbumPhotosResponse>>> getAlbumPhotos(int id) =>
      requestCallWithDetails((_) => getApi().getAlbumPhotos(id));

  @override
  Future<CommonResponse<List<AlbumsResponse>>> getAlbums(int id) =>
      requestCallWithDetails((_) => getApi().getAlbums(id));

  @override
  Future<CommonResponse<List<PostCommentsResponse>>> getPostComments(int id) =>
      requestCallWithDetails((_) => getApi().getPostComments(id));

  @override
  Future<CommonResponse<List<PostsResponse>>> getPosts(int id) =>
      requestCallWithDetails((_) => getApi().getPosts(id));

  @override
  Future<CommonResponse<List<UserResponse>>> getUserDetails(int id) =>
      requestCallWithDetails((_) => getApi().getUserDetails(id));
}
