import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:nfc_box/logger.dart';
import '../../../../../../core/constants/app_paddings.dart';

part 'utils.dart';

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
  late _DateFieldEntryUtils _dateFieldEntryUtils;
  @override
  void initState() {
    _dateFieldEntryUtils = _DateFieldEntryUtils(controller: widget.controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _dateFieldEntryUtils.showDatePicker(
        context,
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
