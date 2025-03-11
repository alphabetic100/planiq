import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/features/employe_flow/profile/controller/language_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});
  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: true,
        appbarHeight: 70,
        title: "Language",
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Select Language",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                _buildLanguageTile("English"),
                _buildLanguageTile("French"),
                _buildLanguageTile("Dutch"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language) {
    return InkWell(
      onTap: () {
        controller.updateLocale(language);
      },
      child: Row(
        children: [
          Obx(() => Radio<String>(
                value: language,
                groupValue: controller.selectedLanguage.value,
                activeColor: const Color(0xFF152A3A),
                onChanged: (value) {
                  controller.updateLocale(value!);
                },
              )),
          CustomText(
            text: language,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF152A3A),
          ),
        ],
      ),
    );
  }
}
