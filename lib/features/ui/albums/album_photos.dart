import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard/app/application.dart';

class AlbumPhotos extends ConsumerWidget {
  const AlbumPhotos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Album Photos"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ref.watch(albumPhotosProvider).when(
                data: (d) {
                  if (d.isNotEmpty) {
                    return GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 6 / 10,
                      crossAxisSpacing: 9,
                      mainAxisSpacing: 20,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      children: d
                          .map((data) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Stack(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                data.thumbnailUrl ?? "",
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
                              ))
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
                    )),
          ),
        ));
  }
}
