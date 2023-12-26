import 'dart:developer';

import 'package:adept_labz/packages/network/api_client_config.dart';
import 'package:adept_labz/packages/network/app/entity/album_photos_response.dart';
import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:adept_labz/packages/network/app/entity/user_response.dart';

abstract class AppRepo {
  Future<List<AlbumPhotosResponse>> getAlbumPhotos(int id);
  Future<List<AlbumsResponse>> getAlbums(int id);
  Future<List<PostCommentsResponse>> getPostComments(int id);
  Future<List<PostsResponse>> getPosts(int id);
  Future<UserResponse?> getUserDetails(int id);
}

class AppRepoImpl extends AppRepo {
  @override
  Future<List<AlbumPhotosResponse>> getAlbumPhotos(int id) async {
    try {
      final response = await APIClientConfig.getAppAPI().getAlbumPhotos(id);
      return response.response ?? [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<List<AlbumsResponse>> getAlbums(int id) async {
    try {
      final response = await APIClientConfig.getAppAPI().getAlbums(id);
      return response.response ?? [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<List<PostCommentsResponse>> getPostComments(int id) async {
    try {
      final response = await APIClientConfig.getAppAPI().getPostComments(id);
      return response.response ?? [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<List<PostsResponse>> getPosts(int id) async {
    try {
      final response = await APIClientConfig.getAppAPI().getPosts(id);
      return response.response ?? [];
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  @override
  Future<UserResponse?> getUserDetails(int id) async {
    try {
      final response = await APIClientConfig.getAppAPI().getUserDetails(id);
      if (response.response != null) {
        return response.response!.first;
      }
      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
