import 'dart:math';

import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/contact_person_card.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/image_path.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/additional_note_section.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/checklist_item_widget.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/job_compleate_dialog.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/report_issue_bottom_sheet.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/tool_tag_widget.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Job Details",
        backButton: true,
      ),
      body: SingleChildScrollView(
        child: BodyPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: 20.h),
              // Header Info
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Job ID: #21545',
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  VerticalSpace(height: 20.h),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor("New Assignment").withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: CustomText(
                      text: 'New Assignment',
                      color: statusColor('New Assignment'),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 20.h),
              // Job Title
              CustomText(
                text: 'Emmergency HVAC Repair',
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(height: 8),

              //Image here if the job is accepted
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://s3-alpha-sig.figma.com/img/5539/7f99/3deccf2071acfcb200e647bfa0eee470?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=AEm1GffbVpE-aWJn1~~JPIRUbnL-hsNkNdFNdf0hCoNGu3fe2q04QjeXIdX4gVGptz7m-ExRj47AvrsngTEW-jt07-tiXfSNQVYb7Tc3liiUrOiwlWpf2D7BlpKk-pkSBcUvuJc02-~GBoS55bSKc17ecNCk~uawYalWJ4Sbs87Hm3YbNU2UAqOhPg2MFAsSdfjk2LfJu8SDMUVAKhqxS0blaqceIECIm7h16-0zxa0lcOilTkae4qrxGvDWAx6a46gdmjtYCxTkZFbqlRsQ~cNxk3iGiZGSSfxXub4wVSWlCmQYWnVoLs6~fEAagLnzDWCgZ54gagBe9qTFiZMWDQ__"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              VerticalSpace(height: 10),
              // Location
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined,
                      color: Color(0xFF526366), size: 20),
                  const SizedBox(width: 8),
                  Flexible(
                    child: CustomText(
                      text: '9641 Sunset Blvd, Beverly Hills, California 90210',
                      color: AppColors.textSecondary,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              VerticalSpace(height: 8),
              // Date
              Row(
                children: [
                  Icon(Icons.calendar_today_outlined,
                      color: AppColors.textSecondary, size: 20),
                  const SizedBox(width: 8),
                  CustomText(
                    text: 'Sun - 22/01/2025',
                    color: AppColors.textSecondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              VerticalSpace(height: 8),
              // Time
              Row(
                children: [
                  Icon(Icons.access_time,
                      color: AppColors.textSecondary, size: 20),
                  const SizedBox(width: 8),
                  CustomText(
                    text: '10.00 AM - 12.30 PM',
                    color: AppColors.textSecondary,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),

              // Map
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child: Stack(
                  children: [
                    // Placeholder for map
                    Image.asset(
                      ImagePath.mapImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    // Navigation button
                    Positioned(
                      right: 16,
                      bottom: 16,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          backgroundColor: const Color(0xFF0D8496),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.h),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: pi * 0.2,
                                child: Icon(Icons.navigation_outlined,
                                    color: Colors.white, size: 18.h),
                              ),
                              HorizontalSpace(width: 8.w),
                              const CustomText(
                                text: 'Navigate',
                                color: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Description Section
              CustomText(
                text: 'Description',
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(height: 20),
              CustomText(
                text:
                    'Commercial AV unit requires immediate maintenance. Client reports unusual noise and reduce cooling efficiency. Unit model: XC21-024. Previous service record indicates potential compressor issues.',
                color: AppColors.textSecondary,
                fontSize: 16.sp,
                height: 1.5,
                fontWeight: FontWeight.normal,
              ),
              VerticalSpace(height: 20),
              // Payment Info
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFE6F0F2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Payment Rate',
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          text: '€85',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Estimated Duration',
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        const SizedBox(height: 4),
                        CustomText(
                          text: '4 hours',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 20.h),
              // Admin Notes
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFFBEB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Admin Notes',
                      color: Color(0xFFD97706),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      text:
                          'Customer requested quiet operation during business hours. Previous maintenance was 6 month ago.',
                      color: Color(0xFF936B3E),
                      fontSize: 14,
                      height: 1.5,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
              VerticalSpace(height: 24),
              // Progress Checklist
              CustomText(
                text: 'Progress Checklist',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(height: 8),
              CustomText(
                text:
                    "Please ensure all steps are completed before marking the task as finished.*",
                color: Color(0xFFD76067),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              VerticalSpace(height: 16),
              // Checklist Items
              ChecklistItemWidget(
                  text: 'Initial inspection completed', isCompleted: true),
              ChecklistItemWidget(
                  text: 'System diagnostic performed', isCompleted: true),
              ChecklistItemWidget(text: 'Filters replaced', isCompleted: true),
              ChecklistItemWidget(
                  text: 'Performance test conducted', isCompleted: false),
              ChecklistItemWidget(text: 'Area Cleaned', isCompleted: false),
              ChecklistItemWidget(text: 'Receive Payment', isCompleted: false),

              // Required Tools
              CustomText(
                text: 'Required Tools',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              VerticalSpace(height: 20), // Tool Tags
              Wrap(
                spacing: 8,
                runSpacing: 10,
                children: [
                  ToolTagWidget(text: 'HVAC Toolkit'),
                  ToolTagWidget(text: 'Pressure Gauge'),
                  ToolTagWidget(text: 'Multimeter'),
                  ToolTagWidget(text: 'Scale'),
                ],
              ),
            
              AdditionalNoteSection(),
              const SizedBox(height: 24),

              // Contact Persons
              ContactPersonCard(
                name: 'David Brown',
                role: 'Customer',
                avatarText: 'D',
                avatarColor: Colors.grey,
              ),
              VerticalSpace(height: 20),
              ContactPersonCard(
                name: 'Jhon Smith',
                role: 'Facility Manager',
                avatarText: 'D',
                avatarColor: Colors.grey,
              ),

              const SizedBox(height: 40),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ReportIssueBottomSheet();
                          });
                    },
                    title: "Decline",
                    titleColor: Color(0xFF526366),
                    isPrimary: false,
                  )),
                  HorizontalSpace(width: 16.w),
                  Expanded(
                      child: CustomButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return JobCompleateDialog();
                          });
                    },
                    title: "Accept",
                  ))
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
