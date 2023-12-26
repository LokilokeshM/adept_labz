// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:adept_labz/features/common/responsive.dart';
import 'package:adept_labz/packages/common/config/config.dart';
import 'package:adept_labz/packages/common/config/size_config.dart';
import 'package:adept_labz/routes/router_path.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:go_router/go_router.dart';

class SplashLogoScreen extends StatefulWidget {
  const SplashLogoScreen({Key? key}) : super(key: key);

  @override
  _SplashLogoScreenState createState() => _SplashLogoScreenState();
}

class _SplashLogoScreenState extends State<SplashLogoScreen> {
  bool _isVisible = false;

  _SplashLogoScreenState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      context.push(RouterPath.SPLASH_SCREEN);
    });

    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        _isVisible =
            true; // Now it is showing fade effect and navigating to Login page
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Container(
          height: SizeConfig.screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Theme.of(context).colorScheme.secondary, primary],
              begin: const FractionalOffset(0, 0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: _animatedLogo(),
        ),
        desktop: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2),
          child: _animatedLogo(),
        ));
  }

  AnimatedOpacity _animatedLogo() {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0,
      duration: const Duration(milliseconds: 1200),
      child: SizedBox(
        height: 200,
        child: Center(
          child: Image.network(
            "https://adeptlabz.com/asset/adept_Logo.png",
            width: 100,
            height: 200,
            color: white,
          ),
        ),
      ),
    );
  }
}
