import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/text_form_field_model.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_arrow_button.dart';
import '../../../../core/widgets/custom_date_picker.dart';
import '../../../../core/widgets/custom_text_form_field_with_title.dart';
import '../../../../routers.dart';
import '../../../cart_screen/presentation/widgets/price_details_cart.dart';

class AddCardPaymentScreen extends StatelessWidget {
  const AddCardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomArrowButton(),
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

                /// [IntrinsicHeight]
                Row(
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
                )
              ],
            ),
          ),
          PriceDetailsCart(
            buttonTitle: 'Make Payment',
            onTap: () {
              context.go(AppRouter.homeNavScreen);
            },
          ),
        ],
      ),
    );
  }
}
