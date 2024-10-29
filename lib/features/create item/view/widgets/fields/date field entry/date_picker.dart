part of 'date_field_entry.dart';

class _DatePicker extends StatelessWidget {
  const _DatePicker();

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      currentDate: DateTime.now(),
      initialCalendarMode: DatePickerMode.day,
      switchToInputEntryModeIcon: const Icon(Icons.edit_calendar_outlined),
    );
  }
}
