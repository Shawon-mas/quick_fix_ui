import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Map<DateTime, List<dynamic>> _events = {
    DateTime(2023, 4, 5): ['Event A'],
    DateTime(2023, 4, 10): ['Event B', 'Event C'],
    DateTime(2023, 4, 15): ['Event D'],
  };

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
  DateTime _lastDay = DateTime.utc(DateTime.now().year, DateTime.now().month + 1, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(30.r)

                ),
                height: 350.h,
                width: double.maxFinite,
                child: TableCalendar(
                  calendarFormat: _calendarFormat,
                  onFormatChanged: (format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  },
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  firstDay: _firstDay,
                  lastDay: _lastDay,
                  eventLoader: (date) {
                    if (_events.containsKey(date)) {
                      return [
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 10.0,
                        ),
                      ];
                    } else {
                      return [];
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Events on ${_selectedDay.day}-${_selectedDay.month}-${_selectedDay.year}',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var event in _events[_selectedDay] ?? [])
                      Text('- $event'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
