import 'package:adept_labz/features/ui/dashboard/app/application.dart';
import 'package:adept_labz/routes/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumList extends ConsumerWidget {
  const AlbumList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(albumsListProvider).when(
        data: (data) {
          if (data.isNotEmpty) {
            return GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 6 / 10,
              crossAxisSpacing: 9,
              mainAxisSpacing: 20,
              padding: const EdgeInsets.symmetric(vertical: 10),
              //physics:BouncingScrollPhysics(),
              children: data
                  .map((data) => GestureDetector(
                      onTap: () {
                        ref
                            .read(albumPhotosProvider.notifier)
                            .getAlbumPhotosList(data.id!);
                        context.push(RouterPath.ALBUM_PHOTOS);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmOfgIfH8OTMAZyIGeZ9wP_DgDJxxslxX9CkraLW1ixg&s",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              data.title ?? "",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )))
                  .toList(),
            );
          } else {
            return const Center(
              child: Text("No Record Widgets"),
            );
          }
        },
        error: (e, st) => Container(),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
