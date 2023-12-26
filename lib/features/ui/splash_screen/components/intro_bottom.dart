// Flutter imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import '../../../../packages/common/config/config.dart';
import 'clear_default_button.dart';

class ActiveDot extends StatelessWidget {
  const ActiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: secondary,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 3, right: 3),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: grey.withOpacity(.5),
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class IntroBottom extends StatelessWidget {
  const IntroBottom({
    Key? key,
    required int currentPage,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              3,
              (idx) {
                return _currentPage == idx
                    ? const ActiveDot()
                    : const InactiveDot();
              },
            ).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(child: Text("")),
              (_currentPage == 2)
                  ? ClearDefaultButton(
                      name: 'Done',
                      press: () {
                        context.go("/");
                      })
                  : ClearDefaultButton(
                      name: 'Skip',
                      press: () {
                        context.go("/");
                      })
            ],
          ),
        ],
      ),
    );
  }
}
