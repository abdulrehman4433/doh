import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key}) : super(key: key);

  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<Onboarding> {
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.black : Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DUMAPOHEALTH',
          style: TextStyle(
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
//        height: double.infinity,
        color: Colors.white,
        child: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
              setState(() {});
            },
            children: <Widget>[
              _buildPageContent(
                  image: 'assets/images/onboarding1.png',
                  title: 'From Sedans to Mini-Vans.',
                  body:
                  'At Dumapo Health we pride ourselves in delivering extensive services to fulfill all of your needs with first rate customer care. Our goal is to make your travels safe, effortless and on schedule.'),
              _buildPageContent(
                  image: 'assets/images/onboarding2.png',
                  title: 'Trip From your door.',
                  body:
                  'I invite you to try our service and I personally guarantee you will have a fully satisfied experience.'),
              _buildPageContent(
                  image: 'assets/images/onboarding3.png',
                  title: 'To your health care practitioner.',
                  body:
                  'By offering exceptional service with no detail unattended, you can meet your at doctor at given time.')
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage != 2
          ? Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                    setState(() {});
                  },
                  splashColor: Colors.blue[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.white,
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                        color: Color(0xFF0074E4),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  child: Row(children: [
                    for (int i = 0; i < _totalPages; i++)
                      i == _currentPage
                          ? _buildPageIndicator(true)
                          : _buildPageIndicator(false)
                  ]),
                ),
                RaisedButton(
                  onPressed: () {
                    _pageController.animateToPage(_currentPage + 1,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                    setState(() {});
                  },
                  splashColor: Colors.blue[50],
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.white,
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                        color: Color(0xFF0074E4),
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ))
          : InkWell(
        //   onTap: () => print('Get Started Now'),
        child: Container(
          height: Platform.isIOS ? 70 : 80,
          //color: Colors.blue,
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/siginupdecision");
            },
            child: Container(
              width: 200.0,
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Philosopher',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent({
    String image,
    String title,
    String body,
  }) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(50.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: Image.asset(image),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16, height: 2.0, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              body,
              style: TextStyle(fontSize: 15, height: 2.0),
            ),
          ],
        ),
      )
    );
  }
}

