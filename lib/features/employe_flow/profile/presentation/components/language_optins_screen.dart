import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/features/employe_flow/profile/controller/language_controller.dart';

class LanguageSelectionScreen extends StatelessWidget {
  LanguageSelectionScreen({super.key});
  final LanguageController controller = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backButton: true,
        appbarHeight: 70.h,
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
            SizedBox(height: 10),
            Column(
              children: [
                _buildLanguageTile("English", isDefault: true),
                _buildLanguageTile("French"),
                _buildLanguageTile("Dutch"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageTile(String language, {bool isDefault = false}) {
    return InkWell(
      onTap: () {
        controller.selectedLanguage.value = language;
      },
      child: Row(
        children: [
          Obx(() => Radio<String>(
                value: language,
                groupValue: controller.selectedLanguage.value,
                activeColor: Color(0xFF152A3A),
                onChanged: (value) {
                  controller.selectedLanguage.value = value!;
                },
              )),
          CustomText(
            text: language,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF152A3A),
          ),
          if (isDefault)
            CustomText(
              text: " (Default)",
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.textSecondary,
            ),
        ],
      ),
    );
  }
}
