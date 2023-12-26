// Package imports:
import 'package:adept_labz/packages/network/app/entity/albums_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/service.dart';

class AlbumListNotifier
    extends StateNotifier<AsyncValue<List<AlbumsResponse>>> {
  AlbumListNotifier(this.ref) : super(const AsyncValue.loading()) {
    getAlbumList();
  }
  Ref ref;
  List<AlbumsResponse> album = [];

  Future<void> getAlbumList() async {
    try {
      album = await ref.watch(appService).getAlbums(1);
      state = AsyncValue.data(album);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
