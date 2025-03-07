import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
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
              Row(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.arrow_back, color: Color(0xFF5B7180)),
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
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Calendar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
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
            calendarBuilders: CalendarBuilders(
              selectedBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xFF0071C2),
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
              outsideBuilder: (context, date, _) {
                return Center(
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(color: Colors.grey.withOpacity(0.5)),
                  ),
                );
              },
            ),
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
              weekendTextStyle: const TextStyle(color: Color(0xFF5B7180)),
              holidayTextStyle: const TextStyle(color: Color(0xFF5B7180)),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: const TextStyle(
                color: Color(0xFF5B7180),
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: const TextStyle(color: Colors.white),
              outsideTextStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
