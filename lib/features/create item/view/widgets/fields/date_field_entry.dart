import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import '../../../../../core/constants/app_paddings.dart';

class DateFieldEntry extends StatefulWidget {
  const DateFieldEntry({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;

  @override
  State<DateFieldEntry> createState() => _DateFieldEntryState();
}

class _DateFieldEntryState extends State<DateFieldEntry> {
  final _DateFieldEntryUtils _dateFieldEntryUtils = _DateFieldEntryUtils();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _dateFieldEntryUtils.showDatePicker(
        context,
        widget.controller,
        setState,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.date_range_outlined),
          Gap(AppPaddings.xsPadding),
          Text(
            _dateFieldEntryUtils._isDateSelected
                ? _dateFieldEntryUtils.buttonLabel
                : DateFormat.MEd().format(_dateFieldEntryUtils.selectedDate!),
          ),
        ],
      ),
    );
  }
}

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
