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
  DateTime? selectedDate;
  static const String buttonLabel = 'Choose Date';
  bool get _isDateSelected => selectedDate == null;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDatePicker(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.date_range_outlined),
          Gap(AppPaddings.xsPadding),
          Text(
            _isDateSelected
                ? buttonLabel
                : DateFormat.MEd().format(selectedDate!),
          ),
        ],
      ),
    );
  }

  void showDatePicker(context) {
    showDialog(
      context: context,

      /// TODO : Turn this into a separate widget
      builder: (context) => DatePickerDialog(
        firstDate: DateTime(2010),
        lastDate: DateTime(2050),
        currentDate: DateTime.now(),
      ),
    ).then((val) => setSelectedDate(val));
  }

  void setSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
    widget.controller.text = selectedDate.toString();
  }
}
