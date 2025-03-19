import 'dart:developer' as developer;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planiq/core/common/widgets/app_spacer.dart';
import 'package:planiq/core/common/widgets/body_padding.dart';
import 'package:planiq/core/common/widgets/contact_person_card.dart';
import 'package:planiq/core/common/widgets/custom_app_bar.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/common/widgets/custom_image_slider.dart';
import 'package:planiq/core/common/widgets/custom_job_card.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/services/Auth_service.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:planiq/core/utils/constants/icon_path.dart';
import 'package:planiq/core/utils/constants/image_path.dart';
import 'package:planiq/core/utils/helpers/app_helper.dart';
import 'package:planiq/features/employe_flow/job_details/controller/job_detail_screen_controller.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/additional_note_section.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/aditional_admin_part.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/checklist_item_widget.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/job_compleate_dialog.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/report_issue_bottom_sheet.dart';
import 'package:planiq/features/employe_flow/job_details/presentation/components/tool_tag_widget.dart';
import 'package:planiq/features/employe_flow/notification/presentation/components/notification_card.dart';
import 'package:planiq/features/super_admin_flow/assign_task/presentation/screen/assign_task_screen.dart';
import 'package:planiq/features/super_admin_flow/edit_task/presentation/view/edit_task_screen.dart';
import 'package:planiq/features/super_admin_flow/jobs/helper/job_status_helper.dart';

class JobDetailsScreen extends StatefulWidget {
  const JobDetailsScreen({
    super.key,
    this.isFromAdmin = false,
    required this.jobId,
    required this.status,
  });
  final bool isFromAdmin;
  final String jobId;
  final String status;

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final JobDetailScreenController jobScreenController =
      Get.put(JobDetailScreenController());
  bool isFromSupervisor = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      jobScreenController.getJobDetails(widget.jobId);
      if (widget.status != "UNASSIGNED") {
        jobScreenController.getAssignedJobDetails(widget.jobId).then((onValue) {
          isFromSupervisor = AuthService.userId ==
              jobScreenController
                  .employeeDetail.value!.data.tasks[0].user.personId;
          setState(() {});
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appbarHeight: 70.h,
        title: "Job Details",
        backButton: true,
      ),
      body: RefreshIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.secondaryColor,
        onRefresh: () => jobScreenController.refreshScreen(widget.jobId),
        child: SingleChildScrollView(
          child: Obx(
            () {
              final job = jobScreenController.jobDetails.value;
              if (job == null) {
                return SizedBox.shrink();
              } else {
                final details = job.data;
                return BodyPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace(height: 20.h),
                      // Header Info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Job ID: #${details.jobId}',
                            color: AppColors.textSecondary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          VerticalSpace(height: 20.h),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: statusColor(widget.isFromAdmin
                                      ? decodeStatus(details.status)
                                      : decodeEmployeStatus(details.status))
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: CustomText(
                              text: widget.isFromAdmin
                                  ? decodeStatus(details.status)
                                  : decodeEmployeStatus(details.status),
                              color: statusColor(widget.isFromAdmin
                                  ? decodeStatus(details.status)
                                  : decodeEmployeStatus(details.status)),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      if (widget.isFromAdmin) ...[
                        if (jobScreenController.employeeDetail.value !=
                            null) ...[
                          details.status != "UNASSIGNED"
                              ? AditionalAdminPart(
                                  user: jobScreenController
                                      .employeeDetail.value!.data,
                                )
                              : SizedBox.shrink(),
                        ]
                      ],
                      VerticalSpace(height: 20.h),
                      // Job Title
                      CustomText(
                        text: details.title,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      VerticalSpace(height: 8),

                      //Image here if the job is accepted
                      details.image.isNotEmpty
                          ? CustomImageSlider(imageUrls: details.image)
                          : SizedBox.shrink(),
                      VerticalSpace(height: 10),
                      // Location
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(IconPath.locationOutlined),
                          const SizedBox(width: 8),
                          Flexible(
                            child: CustomText(
                              text: details.location,
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
                          Image.asset(IconPath.calenderOutlined),
                          const SizedBox(width: 8),
                          CustomText(
                            text: AppHelperFunctions.backendFomater(
                                    details.date) ??
                                "N/A",
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
                          Image.asset(IconPath.timerOutlined),
                          const SizedBox(width: 8),
                          CustomText(
                            text: details.time,
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
                                onPressed: () {
                                  AppHelperFunctions.launchURL(
                                      details.locationLink);
                                  developer.log(details.location);
                                  developer.log(details.locationLink);
                                },
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
                        text: details.description,
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
                                  text: '€${details.rate}',
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
                                  text: details.duration,
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
                        width: double.maxFinite,
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
                              text: details.note,
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
                      if (!widget.isFromAdmin) ...[
                        VerticalSpace(height: 8),
                        CustomText(
                          text:
                              "Please ensure all steps are completed before marking the task as finished.*",
                          color: Color(0xFFD76067),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                      VerticalSpace(height: 16),
                      // Checklist Items

                      Column(
                        children:
                            List.generate(details.progress.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              if (details.status == "WIP") {
                                if (!widget.isFromAdmin && isFromSupervisor) {
                                  jobScreenController.updateJobProgress(
                                      details.progress[index].progress,
                                      widget.jobId);
                                }
                              }
                            },
                            child: ChecklistItemWidget(
                              isCompleted: details.progress[index].isCheck,
                              text: details.progress[index].progress,
                            ),
                          );
                        }),
                      ),

                      // Required Tools
                      if (details.status != "COMPLETED") ...[
                        CustomText(
                          text: 'Required Tools',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        VerticalSpace(height: 20), // Tool Tags
                        Wrap(
                          spacing: 8,
                          runSpacing: 10,
                          children: List.generate(details.requiredTools.length,
                              (index) {
                            return ToolTagWidget(
                                text: details.requiredTools[index]);
                          }),
                        ),
                      ],

                      if (!widget.isFromAdmin) ...[
                        if (details.status == "COMPLETED") ...[
                          AdditionalNoteSection(
                            details: details,
                          ),
                        ],
                      ],
                      const SizedBox(height: 24),
                      // Contact Persons
                      ContactPersonCard(
                        name: details.customerName,
                        role: 'Customer',
                        phoneNumber: details.customerPhone,
                        avatarText: details.customerName.isNotEmpty
                            ? details.customerName.substring(0, 1)
                            : "C",
                        avatarColor: Colors.grey,
                      ),
                      VerticalSpace(height: 20),
                      ContactPersonCard(
                        name: details.managerName,
                        phoneNumber: details.managerPhone,
                        role: 'Facility Manager',
                        avatarText: details.managerName.isNotEmpty
                            ? details.managerName.substring(0, 1)
                            : "M",
                        avatarColor: Colors.grey,
                      ),

                      const SizedBox(height: 40),

                      // Action Buttons

                      if (widget.isFromAdmin || isFromSupervisor) ...[
                        if (details.status != "DECLINED") ...[
                          if (!widget.isFromAdmin) ...[
                            if (details.status == "ACCEPTED") ...[
                              Column(
                                children: [
                                  CustomButton(
                                      onTap: () {
                                        jobScreenController
                                            .startJob(widget.jobId);
                                      },
                                      title: "Start Job"),
                                  VerticalSpace(height: 16.h),
                                  CustomButton(
                                      isPrimary: false,
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return ReportIssueBottomSheet(
                                                jobID: widget.jobId,
                                              );
                                            });
                                      },
                                      titleColor: AppColors.error,
                                      bordercolor: AppColors.error,
                                      title: "Report Issue"),
                                ],
                              )
                            ],
                            if (details.status == "WIP") ...[
                              Column(
                                children: [
                                  CustomButton(
                                      bordercolor: details.progress.every(
                                              (element) => element.isCheck)
                                          ? AppColors.primaryColor
                                          : AppColors.white,
                                      color: details.progress.every(
                                              (element) => element.isCheck)
                                          ? AppColors.primaryColor
                                          : AppColors.primaryColor
                                              .withOpacity(0.5),
                                      onTap: () {
                                        if (details.progress.every(
                                            (element) => element.isCheck)) {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return JobCompleateDialog(
                                                  jobID: widget.jobId,
                                                );
                                              });
                                        }
                                      },
                                      title: "Mark as Complete"),
                                  VerticalSpace(height: 16.h),
                                  CustomButton(
                                      isPrimary: false,
                                      onTap: () {
                                        showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return ReportIssueBottomSheet(
                                                jobID: widget.jobId,
                                              );
                                            });
                                      },
                                      titleColor: AppColors.error,
                                      bordercolor: AppColors.error,
                                      title: "Report Issue"),
                                ],
                              )
                            ],
                            if (details.status != "ACCEPTED" &&
                                details.status != "WIP") ...[
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomButton(
                                    onTap: () {
                                      jobScreenController
                                          .declineTask(widget.jobId);
                                    },
                                    title: "Decline",
                                    titleColor: Color(0xFF526366),
                                    isPrimary: false,
                                  )),
                                  HorizontalSpace(width: 16.w),
                                  Expanded(
                                      child: CustomButton(
                                    onTap: () {
                                      jobScreenController
                                          .acceptTask(widget.jobId);
                                    },
                                    title: "Accept",
                                  ))
                                ],
                              ),
                            ]
                          ] else ...[
                            if (details.status == "UNASSIGNED") ...[
                              CustomButton(
                                  onTap: () {
                                    developer.log(details.id);
                                    Get.to(() =>
                                        AssignTaskScreen(jobID: details.id));
                                  },
                                  title: "Assign Task"),
                              VerticalSpace(height: 16.h)
                            ],
                            if (widget.isFromAdmin) ...[
                              CustomButton(
                                  isPrimary: false,
                                  titleColor: Color(0xFF526366),
                                  bordercolor: AppColors.borderColor,
                                  onTap: () {
                                    Get.to(() => EditTaskScreen(
                                          jobID: widget.jobId,
                                        ));
                                  },
                                  title: "Edit Task"),
                            ]
                          ],
                        ] else if ((widget.isFromAdmin &&
                            details.status == "DECLINED")) ...[
                          CustomButton(
                              titleColor: AppColors.white,
                              onTap: () {
                                developer.log(details.id);
                                Get.to(
                                    () => AssignTaskScreen(jobID: details.id));
                              },
                              title: "Re-Assign Task"),
                          VerticalSpace(height: 16.h),
                          CustomButton(
                              isPrimary: false,
                              titleColor: Color(0xFF526366),
                              bordercolor: AppColors.borderColor,
                              onTap: () {
                                Get.to(EditTaskScreen(
                                  jobID: widget.jobId,
                                ));
                              },
                              title: "Edit Task"),
                        ],
                        const SizedBox(height: 40),
                      ],
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
