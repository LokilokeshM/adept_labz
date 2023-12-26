import 'package:adept_labz/features/common/config/config.dart';
import 'package:adept_labz/features/ui/dashboard/app/application.dart';
import 'package:adept_labz/routes/router_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class PostList extends ConsumerWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(postsListProvider).when(
        data: (data) {
          if (data.isNotEmpty) {
            return Expanded(
              child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      ref
                          .read(commentsListProvider.notifier)
                          .getPostComments(data[index].id!);
                      context.push(RouterPath.POST_DETAILS, extra: data[index]);
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: kDarkColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data[index].title.toString(),
                            style:
                                GoogleFonts.rubik(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            data[index].body.toString(),
                            style: GoogleFonts.rubik(
                                color: grey, fontWeight: FontWeight.w100),
                          )
                        ],
                      ),
                    )),
              ),
            );
          } else {
            return const Center(
              child: Text("No Record Widgets"),
            );
          }
        },
        error: (e, st) => const Center(
              child: Text("No Record Widgets"),
            ),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}
