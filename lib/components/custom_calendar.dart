import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Map<DateTime, List<dynamic>> events;
  final void Function(DateTime, DateTime) onDaySelected;

  const Calendario({
    super.key,
    required this.focusedDay,
    this.selectedDay,
    required this.events,
    required this.onDaySelected,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay,
      calendarFormat: CalendarFormat.month,
      onDaySelected: (selectedDay, focusedDay) => onDaySelected(selectedDay, focusedDay),
      selectedDayPredicate: (day) => isSameDay(selectedDay, day),
      eventLoader: (day) => events[day] ?? [],
      availableCalendarFormats: const {
        CalendarFormat.month: 'Mês',
      },
    );
  }
}
