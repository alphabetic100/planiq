import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupervisorLandingController extends GetxController {
  final PageController pageController = PageController();

  RxInt currentPage = 0.obs;

  changePage(int page) {
    currentPage.value = page;
    log(page.toString());
    pageController.jumpToPage(
      page,
    );
  }
}
