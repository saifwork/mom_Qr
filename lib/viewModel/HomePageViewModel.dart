import 'package:flutter/material.dart';
import '../view/FeedBackForm/FeedBackForm.dart';
import '../view/HomePage.dart';
import '../view/UserForm.dart';

class HomePageViewModel extends ChangeNotifier {
  int currentIndex = 0;
  PageController pageController = PageController();
  final List<Widget> pages = [
    UserForm(),
    FeedbackForm(),
  ];

  HomePageViewModel() {
    pageController.addListener(() {
      currentIndex = pageController.page!.round();
      notifyListeners();
    });
  }

  void changeIndex() {
    print(pageController.page);

    if (pageController.page == pages.length - 1) {
      pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    currentIndex = pageController.page!.toInt();
    notifyListeners();
    print(currentIndex);
  }

}
