import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(inputDate);

    // Format the date to "dd/MM/yyyy"
    return DateFormat("dd/MM/yyyy").format(dateTime);
  } catch (e) {
    return null; // Return null if parsing fails
  }
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
}
