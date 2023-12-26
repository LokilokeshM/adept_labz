// Package imports:
import 'package:adept_labz/packages/network/app/entity/user_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../service/service.dart';

class UserNotifier extends StateNotifier<AsyncValue<UserResponse>> {
  UserNotifier(this.ref) : super(const AsyncValue.loading()) {
    getUser();
  }
  Ref ref;
  UserResponse? user;

  Future<void> getUser() async {
    try {
      user = await ref.watch(appService).getUserDetails(1);
      state = AsyncValue.data(user!);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
