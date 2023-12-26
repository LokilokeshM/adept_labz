import 'package:adept_labz/features/common/config/config.dart';
import 'package:adept_labz/features/ui/dashboard/app/application.dart';
import 'package:adept_labz/packages/network/app/entity/posts_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetails extends ConsumerWidget {
  const PostDetails({super.key, required this.post});
  final PostsResponse post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "Post Details",
          style: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Title",
                style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            Text(
              post.title.toString(),
            ),
            Text("Body", style: GoogleFonts.rubik(fontWeight: FontWeight.bold)),
            Text(post.body.toString()),
            Text(
              "Comments :",
              style: GoogleFonts.rubik(fontWeight: FontWeight.bold),
            ),
            ref.watch(commentsListProvider).when(
                data: (data) {
                  if (data.isNotEmpty) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: ListView.separated(
                          separatorBuilder: (_, index) => Divider(),
                          itemCount: data.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1} . ",
                                style: GoogleFonts.cabin(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${data[index].name.toString()} (${data[index].email.toString()})"),
                                    Text(data[index].body.toString()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
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
                    )),
          ]),
        ),
      ),
    );
  }
}
