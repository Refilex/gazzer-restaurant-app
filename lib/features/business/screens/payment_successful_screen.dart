import 'package:gazzer_vendorapp/common/widgets/custom_app_bar_widget.dart';
import 'package:gazzer_vendorapp/common/widgets/custom_button_widget.dart';
import 'package:gazzer_vendorapp/helper/route_helper.dart';
import 'package:gazzer_vendorapp/util/dimensions.dart';
import 'package:gazzer_vendorapp/util/images.dart';
import 'package:gazzer_vendorapp/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessfulScreen extends StatelessWidget {
  final bool success;
  final bool isWalletPayment;

  const PaymentSuccessfulScreen(
      {super.key, required this.success, required this.isWalletPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: '', isBackButtonExist: false),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset(success ? Images.checked : Images.warning,
            width: 100,
            height: 100,
            color: success
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.error),
        const SizedBox(height: Dimensions.paddingSizeLarge),
        Text(
          success
              ? 'your_payment_is_successfully_done'.tr
              : 'your_payment_is_not_done'.tr,
          style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeLarge),
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: CustomButtonWidget(
              buttonText: 'okay'.tr,
              onPressed: () {
                if (isWalletPayment) {
                  Get.offAllNamed(RouteHelper.getInitialRoute());
                } else {
                  Get.offAllNamed(RouteHelper.getSignInRoute());
                }
              }),
        ),
      ])),
    );
  }
}
