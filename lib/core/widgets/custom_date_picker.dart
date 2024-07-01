import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_extensions.dart';
import '../helper/data_time_helper.dart';
import '../theme/app_text_style.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    required this.onPick,
  });

  final ValueChanged<DateTime?> onPick;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;

  String get text {
    if (_selectedDate != null) {
      return DateTimeHelper.formatMonthYearShort(_selectedDate);
    } else {
      return 'Select Date';
    }
  }

  @override
  void initState() {
    _selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final result = await showDatePicker(
          context: context,
          initialDate: widget.initialDate,
          firstDate: widget.firstDate ?? DateTime.now(),
          lastDate: widget.lastDate ?? DateTime(2100),
        );
        if (result != null) {
          setState(() {
            _selectedDate = result;
          });
          widget.onPick(result);
        }
      },
      child: Container(
        height: 68,
        width: context.width,
        alignment: Alignment.bottomCenter,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.black),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyle.f16w400darkGrey.copyWith(
            height: 3,
          ),
        ),
      ),
    );
  }
}
