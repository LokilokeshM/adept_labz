import 'package:adept_labz/features/ui/dashboard/service/repo/repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appService = Provider((ref) => AppRepoImpl());
