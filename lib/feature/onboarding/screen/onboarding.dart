import 'package:flutter/material.dart';

import '../../../main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Widget> pages = [
    const NotGetCertificateScreen(),
    const NotGetCertificateScreen(),
    const NotGetCertificateScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// PAGEVIEW (Main screens)
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),

          /// NEXT BUTTON over the screens (always visible)
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < pages.length - 1) {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    /// Last page → navigate
                    // Navigator.pushReplacement(...)
                  }
                },
                child: const Text("Next"),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
