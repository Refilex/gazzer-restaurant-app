import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:gazzer_vendorapp/features/splash/controllers/splash_controller.dart';
import 'package:gazzer_vendorapp/util/dimensions.dart';
import 'package:gazzer_vendorapp/util/images.dart';
import 'package:gazzer_vendorapp/util/styles.dart';

class TransactionStatusCardWidget extends StatelessWidget {
  final bool isCompleted;
  final bool isCompletedCash;
  final bool isCompletedDigital;
  final bool isTotalAdminCommission;
  final bool isOnHold;
  final double amount;
  final JustTheController? completedToolTip;
  final JustTheController? onHoldToolTip;
  final JustTheController? canceledToolTip;

  const TransactionStatusCardWidget(
      {super.key,
      this.isCompleted = false,
      this.isCompletedCash = false,
      this.isCompletedDigital = false,
      this.isTotalAdminCommission = false,
      this.isOnHold = false,
      required this.amount,
      this.completedToolTip,
      this.onHoldToolTip,
      this.canceledToolTip});

  @override
  Widget build(BuildContext context) {
    bool isRightSide =
        Get.find<SplashController>().configModel!.currencySymbolDirection ==
            'right';

    return Container(
      height: 240,
      width: 180,
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        color: Theme.of(context).disabledColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
      ),
      child: Column(children: [
        Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: isCompleted
                      ? Colors.green
                      : isOnHold
                          ? Colors.blue
                          : Colors.red,
                  shape: BoxShape.circle),
              child: JustTheTooltip(
                backgroundColor: Colors.black87,
                controller: isCompleted
                    ? completedToolTip
                    : isOnHold
                        ? onHoldToolTip
                        : canceledToolTip,
                preferredDirection: AxisDirection.right,
                tailLength: 14,
                tailBaseWidth: 20,
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    isCompleted
                        ? 'completed_tool_tip'.tr
                        : isOnHold
                            ? 'on_hold_tool_tip'.tr
                            : 'canceled_tool_tip'.tr,
                    style: robotoRegular.copyWith(color: Colors.white),
                  ),
                ),
                child: InkWell(
                  onTap: () {
                    if (isCompleted) {
                      completedToolTip!.showTooltip();
                    } else if (isOnHold) {
                      onHoldToolTip!.showTooltip();
                    } else {
                      canceledToolTip!.showTooltip();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.info,
                      color: isCompleted
                          ? Colors.green
                          : isOnHold
                              ? Colors.blue
                              : Colors.red,
                      size: 15,
                    ),
                  ),
                ),
              ),
            )),
        Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Stack(children: [
              Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                decoration: BoxDecoration(
                    color: isCompleted
                        ? Colors.green
                        : isOnHold
                            ? Colors.blue
                            : Colors.red,
                    shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(Images.transactionReportIcon),
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Image.asset(
                  isOnHold
                      ? Images.onHoldTransactionIcon
                      : isCompleted
                          ? Images.completeTransactionIcon
                          : Images.cancelTransactionIcon,
                  height: 15,
                  width: 15,
                ),
              ),
            ]),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Text(
              '${isRightSide ? '' : '${Get.find<SplashController>().configModel!.currencySymbol!} '}'
              '$amount'
              '${isRightSide ? ' ${Get.find<SplashController>().configModel!.currencySymbol!}' : ''}',
              style: robotoBold.copyWith(
                fontSize: 20,
                color: isCompleted
                    ? Colors.green
                    : isOnHold
                        ? Colors.blue
                        : Colors.red,
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Text(
                (() {
                  if (isCompleted) {
                    if (isCompletedCash) return "completed_transactions_cash".tr;
                    if (isCompletedDigital) return "completed_transactions_digital".tr;
                    if (isTotalAdminCommission) return "total_admin_commission".tr;
                    
                    return "completed_transactions".tr;
                  } else if (isOnHold) {
                    return "on_hold_transactions".tr;
                  } else {
                    return "canceled_transactions".tr;
                  }
                })(),
                textAlign: TextAlign.center,
                style: robotoRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Theme.of(context).textTheme.bodyMedium!.color,
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
