// Flutter imports:
import 'package:adept_labz/features/common/config/config.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenData extends StatelessWidget {
  final String? introImage, headText, descText;
  const SplashScreenData(
      {Key? key, this.introImage, this.headText, this.descText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
            image: NetworkImage(introImage ?? ""),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height / 2),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Text(
            headText ?? "",
            textAlign: TextAlign.center,
            style: kHeadTextStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            descText ?? "",
            textAlign: TextAlign.center,
            style: kSubTextStyle,
          ),
        ),
      ],
    );
  }
}
