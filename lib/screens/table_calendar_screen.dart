import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarScreen extends StatelessWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _focused = DateTime(2022, 7, 8);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Table Calendar'),
      ),
      body: ListView(
        children: [
          TableCalendar(
            currentDay: DateTime(2022, 7, 8),
            focusedDay: _focused,
            firstDay: _focused.subtract(const Duration(days: 366)),
            lastDay: _focused.add(const Duration(days: 366)),
            availableGestures: AvailableGestures.horizontalSwipe,
            // daysOfWeekVisible: false,
            startingDayOfWeek: StartingDayOfWeek.saturday,
            weekendDays: const [DateTime.friday, DateTime.saturday],
            // shouldFillViewport: false,
            // daysOfWeekHeight: 100,
            // enabledDayPredicate: ,
            onDaySelected: (selected, focused) {
              _focused = focused;
              log(selected.toString());
              log(focused.toString());
            },
            sixWeekMonthsEnforced: true,
            // simpleSwipeConfig: ,
            // dayHitTestBehavior: ,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            calendarStyle: const CalendarStyle(),
          ),
        ],
      ),
    );
  }
}
