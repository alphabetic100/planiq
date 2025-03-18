import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:planiq/core/common/widgets/custom_text.dart';
import 'package:planiq/core/utils/constants/app_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime)? onDaySelected;
  final DateTime? selectedDay;

  const CustomCalendarWidget({
    super.key,
    this.initialDate,
    this.onDaySelected,
    this.selectedDay,
  });

  @override
  State<CustomCalendarWidget> createState() => _CustomCalendarWidgetState();
}

class _CustomCalendarWidgetState extends State<CustomCalendarWidget> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;
  bool _isYearMonthPicker = false;

  @override
  void initState() {
    super.initState();
    _focusedDay = widget.initialDate ?? DateTime.now();
    _selectedDay = widget.selectedDay ?? DateTime.now();
    _calendarFormat = CalendarFormat.month;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isYearMonthPicker = !_isYearMonthPicker;
                  });
                },
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back,
                          color: Color(0xFF5B7180)),
                      onPressed: () {
                        setState(() {
                          _focusedDay =
                              DateTime(_focusedDay.year, _focusedDay.month - 1);
                        });
                      },
                    ),
                    Spacer(),
                    Text(
                      DateFormat('MMMM yyyy').format(_focusedDay),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B7180)),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward,
                          color: Color(0xFF5B7180)),
                      onPressed: () {
                        setState(() {
                          _focusedDay =
                              DateTime(_focusedDay.year, _focusedDay.month + 1);
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (_isYearMonthPicker)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0.w),
                  child: Column(
                    children: [
                      DropdownButton<int>(
                        underline: SizedBox.shrink(),
                        isExpanded: true,
                        value: _focusedDay.year,
                        items: List.generate(100, (index) {
                          int year = DateTime.now().year - index;
                          return DropdownMenuItem(
                            value: year,
                            child: CustomText(
                              text: year.toString(),
                              color: Color(0xFF5B7180),
                            ),
                          );
                        }),
                        onChanged: (year) {
                          if (year != null) {
                            setState(() {
                              _focusedDay = DateTime(year, _focusedDay.month);
                            });
                          }
                        },
                      ),
                      DropdownButton<int>(
                        underline: SizedBox.shrink(),
                        isExpanded: true,
                        value: _focusedDay.month,
                        items: List.generate(12, (index) {
                          return DropdownMenuItem(
                            value: index + 1,
                            child: CustomText(
                              text: DateFormat.MMMM()
                                  .format(DateTime(0, index + 1)),
                              color: Color(0xFF5B7180),
                            ),
                          );
                        }),
                        onChanged: (month) {
                          if (month != null) {
                            setState(() {
                              _focusedDay = DateTime(_focusedDay.year, month);
                              _isYearMonthPicker = false;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Calendar
        if (!_isYearMonthPicker)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(1920, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                  Get.back();
                });
                if (widget.onDaySelected != null) {
                  widget.onDaySelected!(selectedDay);
                }
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              headerVisible: false,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: Color(0xFF5B7180)),
                weekendStyle: TextStyle(color: Color(0xFF5B7180)),
              ),
              daysOfWeekHeight: 30,
              rowHeight: 44,
              calendarStyle: CalendarStyle(
                defaultTextStyle: TextStyle(color: Color(0xFF5B7180)),
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                todayTextStyle: const TextStyle(
                  color: Color(0xFF5B7180),
                  fontWeight: FontWeight.bold,
                ),
                selectedDecoration: BoxDecoration(
                    color: Color(0xFF0071C2),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
      ],
    );
  }
}
