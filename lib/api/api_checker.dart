import 'package:gazzer_vendorapp/features/auth/controllers/auth_controller.dart';
import 'package:gazzer_vendorapp/helper/route_helper.dart';
import 'package:gazzer_vendorapp/common/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      Get.find<AuthController>().clearSharedData();
      Get.offAllNamed(RouteHelper.getSignInRoute());
    } else {
      showCustomSnackBar(response.statusText);
    }
  }
}
