import 'package:adept_labz/features/ui/dashboard/app/album_list_notifier.dart';
import 'package:adept_labz/features/ui/dashboard/app/album_photos_notifier.dart';
import 'package:adept_labz/features/ui/dashboard/app/comments_list_notifier.dart';
import 'package:adept_labz/features/ui/dashboard/app/posts_list_notifier.dart';
import 'package:adept_labz/features/ui/dashboard/app/user_notifier.dart';
import 'package:adept_labz/packages/network/app/entity/album_photos_response.dart';
import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:adept_labz/packages/network/app/entity/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier handle Albums
final albumsListProvider =
    StateNotifierProvider<AlbumListNotifier, AsyncValue<List<AlbumsResponse>>>(
        (ref) => AlbumListNotifier(ref));

/// Notifier handle Album Photos
final albumPhotosProvider = StateNotifierProvider<AlbumPhotosNotifier,
    AsyncValue<List<AlbumPhotosResponse>>>((ref) => AlbumPhotosNotifier(ref));

/// Notifier handle Album Photos
final postsListProvider =
    StateNotifierProvider<PostsListNotifier, AsyncValue<List<PostsResponse>>>(
        (ref) => PostsListNotifier(ref));

/// handle posts comments
final commentsListProvider = StateNotifierProvider<CommentsListNotifier,
    AsyncValue<List<PostCommentsResponse>>>((ref) => CommentsListNotifier(ref));

/// handle User
final userProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<UserResponse>>(
        (ref) => UserNotifier(ref));
