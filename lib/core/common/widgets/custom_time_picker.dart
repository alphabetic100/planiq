import 'package:flutter/material.dart';
import 'package:planiq/core/common/widgets/custom_button.dart';
import 'package:planiq/core/utils/constants/app_colors.dart';

class TimeRangePickerDialog extends StatefulWidget {
  final Function(String) onTimeSelected;

  const TimeRangePickerDialog({super.key, required this.onTimeSelected});

  @override
  _TimeRangePickerDialogState createState() => _TimeRangePickerDialogState();
}

class _TimeRangePickerDialogState extends State<TimeRangePickerDialog> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    TimeOfDay initialTime = TimeOfDay.now();
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            dialogBackgroundColor: Colors.white,
            textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.black),
            ),
            timePickerTheme: TimePickerThemeData(
              helpTextStyle: TextStyle(color: AppColors.black, fontSize: 25),
              dayPeriodTextColor: WidgetStateColor.resolveWith((states) =>
                  states.contains(WidgetState.selected)
                      ? AppColors.white
                      : AppColors.primaryColor),
              dayPeriodColor: WidgetStateColor.resolveWith((states) =>
                  states.contains(WidgetState.selected)
                      ? AppColors.primaryColor
                      : AppColors.white),
              dialHandColor: AppColors.primaryColor,
              backgroundColor: AppColors.white,
              dialBackgroundColor: AppColors.secondaryColor,
              dialTextColor: WidgetStateColor.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? Colors.white
                    : AppColors.primaryColor,
              ),
              hourMinuteColor: AppColors.primaryColor,
              hourMinuteTextColor: AppColors.white,
              entryModeIconColor: AppColors.primaryColor,
              cancelButtonStyle: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              confirmButtonStyle: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          startTime = pickedTime;
        } else {
          endTime = pickedTime;
        }
      });
    }
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return "";
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? "AM" : "PM";
    return "$hour:$minute $period";
  }

  void _submit() {
    if (startTime != null && endTime != null) {
      String formattedTimeRange =
          "${_formatTime(startTime)} - ${_formatTime(endTime)}";
      widget.onTimeSelected(formattedTimeRange);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Please select both start and end times.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Select Time Range",
        style: TextStyle(color: AppColors.backgroundDark),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("Start Time: ${_formatTime(startTime)}"),
            trailing: const Icon(Icons.access_time),
            onTap: () => _pickTime(context, true),
          ),
          ListTile(
            title: Text("End Time: ${_formatTime(endTime)}"),
            trailing: const Icon(Icons.access_time),
            onTap: () => _pickTime(context, false),
          ),
        ],
      ),
      actions: [
        //   CustomButton(onTap: Get.back, title: "Cancel"),
        CustomButton(onTap: _submit, title: "Confirm")
      ],
    );
  }
}
