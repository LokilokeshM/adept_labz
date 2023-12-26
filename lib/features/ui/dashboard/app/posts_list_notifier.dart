// Package imports:
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/service.dart';

class PostsListNotifier extends StateNotifier<AsyncValue<List<PostsResponse>>> {
  PostsListNotifier(this.ref) : super(const AsyncValue.loading()) {
    getPostsList();
  }
  Ref ref;
  List<PostsResponse> posts = [];

  Future<void> getPostsList() async {
    try {
      posts = await ref.watch(appService).getPosts(1);
      state = AsyncValue.data(posts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
