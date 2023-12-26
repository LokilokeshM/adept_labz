// Package imports:
import 'package:adept_labz/packages/network/app/entity/album_photos_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/service.dart';

class AlbumPhotosNotifier
    extends StateNotifier<AsyncValue<List<AlbumPhotosResponse>>> {
  AlbumPhotosNotifier(this.ref) : super(const AsyncValue.loading());
  Ref ref;
  List<AlbumPhotosResponse> photos = [];

  Future<void> getAlbumPhotosList(int id) async {
    try {
      photos = await ref.watch(appService).getAlbumPhotos(id);
      state = AsyncValue.data(photos);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
