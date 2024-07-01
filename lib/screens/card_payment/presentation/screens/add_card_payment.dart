import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/helper/data_time_helper.dart';
import '../../../../core/extensions/build_context_extensions.dart';
import '../../../../core/models/text_form_field_model.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_text_form_field_with_title.dart';
import '../../../cart_screen/presentation/widgets/price_details_cart.dart';

class AddCardPaymentScreen extends StatelessWidget {
  const AddCardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Card',
          style: AppTextStyle.f16w600darkGrey,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(AppPadding.p20),
              children: [
                TextFormFieldWithTitle(
                  title: 'Card holder name',
                  model: TextFormFieldModel(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                  ),
                ),
                const Gap(8),
                TextFormFieldWithTitle(
                  title: 'Card Number',
                  model: TextFormFieldModel(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Gap(8),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomDatePicker(
                          onPick: (DateTime? value) {},
                        ),
                      ),
                      const Gap(16),
                      Expanded(
                        child: TextFormFieldWithTitle(
                          title: 'CVC',
                          model: TextFormFieldModel(
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const PriceDetailsCart(
            buttonTitle: 'Make Payment',
          ),
        ],
      ),
    );
  }
}

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
