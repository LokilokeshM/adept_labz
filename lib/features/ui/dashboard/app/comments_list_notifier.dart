// Package imports:
import 'package:adept_labz/packages/network/app/entity/post_comments_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/service.dart';

class CommentsListNotifier
    extends StateNotifier<AsyncValue<List<PostCommentsResponse>>> {
  CommentsListNotifier(this.ref) : super(const AsyncValue.loading());
  Ref ref;
  List<PostCommentsResponse> postComments = [];

  Future<void> getPostComments(int id) async {
    try {
      postComments = await ref.watch(appService).getPostComments(id);
      state = AsyncValue.data(postComments);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
