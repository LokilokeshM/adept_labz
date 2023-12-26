// Flutter imports:
import 'package:adept_labz/features/common/widgets/button/custom_button.dart';
import 'package:adept_labz/packages/common/config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Project imports:

import 'package:google_fonts/google_fonts.dart';
import '../../../packages/common/config/config.dart';

List<Map<String, String>> introData = [
  {
    'image':
        "https://img.freepik.com/free-vector/ecommerce-internet-shopping-promotion-campaign_335657-2977.jpg",
    'headText': 'Stay Connected',
    'descText':
        "Doing great work with your team should not stop when you're on the go",
  },
  {
    'image':
        "https://img.freepik.com/premium-vector/e-commerce-vector-illustration-concept_95561-50.jpg",
    'headText': 'Respond Quickly',
    'descText': "Collaborate with your team with comments and direct messages",
  },
  {
    'image':
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFIBOv1qpgbVY1T5EoK2jpAlTlgsVhkiJj-5K29B7j-tmpjDIwps8eDBY9vMwH8w2m8tQ&usqp=CAU",
    'headText': 'Create New Issues',
    'descText': "Create, share assign new issues whenever, wherever",
  },
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
          color: white,
          // image: const DecorationImage(
          //     image: NetworkImage(
          //         "https://images.pexels.com/photos/3302537/pexels-photo-3302537.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")),

          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.4, 0.7, 0.9],
            colors: [
              Colors.grey.shade100,
              Colors.grey.shade400,
              Colors.grey.shade700,
              Colors.black,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 600.0,
                alignment: Alignment.center,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    ...introData.map(
                      (e) => Stack(
                        children: <Widget>[
                          Positioned(
                            bottom: 100,
                            right: 10,
                            left: 10,
                            child: Center(
                              child: Text(
                                e["headText"] ?? "",
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cabin(
                                    fontSize: 24,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 50,
                            right: 20,
                            left: 20,
                            child: Text(
                              e["descText"] ?? "",
                              style: GoogleFonts.rubik(
                                  fontSize: 20,
                                  color: white,
                                  fontWeight: FontWeight.w200),
                              maxLines: 2,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: CustomDefaultButton(
                      press: () {
                        context.go("/");
                      },
                      text: "Browse Collection",
                      buttonTextColor: white,
                      backgroundColor: primary,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
