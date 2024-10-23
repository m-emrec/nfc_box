import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nfc_box/core/constants/app_paddings.dart';

class FieldDate extends StatefulWidget {
  const FieldDate({super.key});

  @override
  State<FieldDate> createState() => _FieldDateState();
}

class _FieldDateState extends State<FieldDate> {
  DateTime? selectedDate;
  showDatePicker(context) {
    showDialog(
      context: context,
      builder: (context) => DatePickerDialog(
        firstDate: DateTime(2010),
        lastDate: DateTime(2050),
        currentDate: DateTime.now(),
      ),
    ).then((val) => setSelectedDate(val));
  }

  setSelectedDate(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

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
            selectedDate == null
                ? "Select Date"
                : DateFormat.MEd().format(selectedDate!),
          ),
        ],
      ),
    );
  }
}
