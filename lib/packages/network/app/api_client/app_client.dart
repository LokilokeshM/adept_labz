// Project imports:

import 'package:adept_labz/packages/network/app/entity/album_photos_response.dart';
import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:adept_labz/packages/network/app/entity/user_response.dart';
import 'package:adept_labz/packages/network/entity/common_response.dart';

import '../entity/posts_response.dart';

abstract class AppClient {
  Future<CommonResponse<List<AlbumPhotosResponse>>> getAlbumPhotos(int id);
  Future<CommonResponse<List<AlbumsResponse>>> getAlbums(int id);
  Future<CommonResponse<List<PostCommentsResponse>>> getPostComments(int id);
  Future<CommonResponse<List<PostsResponse>>> getPosts(int id);
  Future<CommonResponse<List<UserResponse>>> getUserDetails(int id);
}
