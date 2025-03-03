import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperLandingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentPage = 0.obs;

  changePage(int page) {
    currentPage.value = page;

    pageController.jumpToPage(
      page,
      // duration: Duration(milliseconds: 200),
      // curve: Curves.linear,
    );
  }
}
