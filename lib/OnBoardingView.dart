   import 'dart:io';

import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key key}) : super(key: key);

  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'assets/conversation-2.png',
                    body: 'Set your own goals and get better',
                    desc: "Goal support your motivation and inspire you to work harder",
                    color: Color.fromRGBO(130,172,38, 1)),
                _buildPageContent(
                    isShowImageOnTop: true,
                    image: 'assets/conversation-1.png',
                    body: 'Track your progress with statistics ',
                    desc: "Analyse personal result with detailed chart and numerical values",
                    color: Color.fromRGBO(255,141,104, 1)),
                _buildPageContent(
                    isShowImageOnTop: false,
                    image: 'assets/conversation-3.png',
                    body: 'Create photo comparisons and share your results',
                    desc: "Take before and after photos to visualize progress and get the shape that you dream about",
                    color: Color.fromRGBO(195,169,255, 1))
              ],
            ),
            Positioned(
              bottom: 10,
              left: MediaQuery.of(context).size.width * .05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * .9,
                    child: Row(
                      children: [
                        Container(
                          child: Row(children: [
                            for (int i = 0; i < _totalPages; i++) i == _currentPage ? _buildPageIndicator(true) : _buildPageIndicator(false)
                          ]),
                        ),
                        Spacer(),
                        if (_currentPage != 2)
                          InkWell(
                            onTap: () {
                              _pageController.animateToPage(2, duration: Duration(milliseconds: 400), curve: Curves.linear);
                              setState(() {});
                            },
                            child: Container(
                              height: Platform.isIOS ? 70 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Skip',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ),
                        if (_currentPage == 2)
                          InkWell(
                            onTap: () => print('Get Started Now'),
                            child: Container(
                              height: Platform.isIOS ? 70 : 60,
                              alignment: Alignment.center,
                              child: Text(
                                'Start',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPageContent({String image, String body, String desc, Color color, isShowImageOnTop}) {
    return Container(
      decoration: BoxDecoration(color: color),
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (!isShowImageOnTop)
            Column(
              children: [
                Center(
                  child: Image.asset(image),
                ),
                SizedBox(height: 20),
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, height: 1.6, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, height: 1.6, fontWeight: FontWeight.w800, color: Colors.blueGrey),
                ),
              ],
            ),
          if (isShowImageOnTop)
            Column(
              children: [
                Text(
                  body,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, height: 1.6, fontWeight: FontWeight.w800, color: Colors.white),
                ),
                Text(
                  desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, height: 1.6, fontWeight: FontWeight.w800, color: Colors.white54),
                ),
                SizedBox(height: 20),
                Center(
                  child: Image.asset(image),
                ),
              ],
            )
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: isCurrentPage ? 10.0 : 10.0,
      width: isCurrentPage ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}