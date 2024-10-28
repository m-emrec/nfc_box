part of 'date_field_entry.dart';

class _DateFieldEntryUtils {
  DateTime? selectedDate;
  final String buttonLabel = 'Choose Date';
  bool get _isDateSelected => selectedDate == null;

  /// This method shows the date picker dialog
  void showDatePicker(context, TextEditingController controller, setState) {
    showDialog(
      context: context,
      builder: (context) => DatePickerDialog(
        firstDate: DateTime(2010),
        lastDate: DateTime(2050),
        currentDate: DateTime.now(),
      ),
    ).then(
      /// if val is not null then set the selected date
      (val) => val != null ? setSelectedDate(val, controller, setState) : {},
    );
  }

  /// This method sets the selected date to the given date
  void setSelectedDate(
      DateTime date, TextEditingController controller, setState) {
    setState(() {
      selectedDate = date;
    });
    controller.text = selectedDate.toString();
  }
}
