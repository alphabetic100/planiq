import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelperFunctions {
  AppHelperFunctions._();
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String? convertDateFormat(String? inputDate) {
    if (inputDate == null) return null;

    try {
      // Parse the input date with the "dd/MM/yyyy" format
      DateTime dateTime = DateFormat("dd/MM/yyyy").parse(inputDate);

      // Format the date to "yyyy-MM-dd"
      return DateFormat("yyyy-MM-dd").format(dateTime);
    } catch (e) {
      return null; // Return null if parsing fails
    }
  }

  static String? backendFomater(String? inputDate) {
    if (inputDate == null) return null;

    try {
      // Parse the input date with the format "yyyy-MM-dd HH:mm:ss.SSS"
      DateTime dateTime =
          DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(inputDate);

      // Format the date to "dd/MM/yyyy"
      return DateFormat("dd/MM/yyyy").format(dateTime);
    } catch (e) {
      return null; // Return null if parsing fails
    }
  }

  static String formatDate(String inputDate) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(inputDate);

    // Format the DateTime object into "dd/MM/yyyy"
    String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

    return formattedDate;
  }

  // Function to generate a unique file name based on the current timestamp and original file name
  static String generateUniqueFileName(String filePath) {
    // Get the original file name from the path
    String fileName = filePath.split('/').last;

    // Generate a unique string using the current timestamp and a random number
    String uniqueString =
        '${DateTime.now().millisecondsSinceEpoch}_${Random().nextInt(1000)}';

    // Get the file extension
    String fileExtension = fileName.split('.').last;

    // Combine unique string with the file extension to generate a unique file name
    return '$uniqueString.$fileExtension';
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String formatDateTime(String dateTime) {
  DateTime parsedDate = DateTime.parse(dateTime);
  String formattedDate = DateFormat('E - dd/MM/yyyy').format(parsedDate);
  return formattedDate;
}

  static String getCurrentDateTime() {
    DateTime now = DateTime.now();
    // Format the date as "Monday, January 17"
    String formattedDate = DateFormat('EEEE, MMMM dd').format(now);
    return formattedDate;
  }

  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch call to $phoneNumber');
    }
  }
}
