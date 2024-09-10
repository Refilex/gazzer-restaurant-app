import 'package:gazzer_vendorapp/common/widgets/custom_image_widget.dart';
import 'package:gazzer_vendorapp/features/auth/controllers/auth_controller.dart';
import 'package:gazzer_vendorapp/features/profile/controllers/profile_controller.dart';
import 'package:gazzer_vendorapp/features/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImageWidget extends StatelessWidget {
  final double size;

  const ProfileImageWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileController) {
      return Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.white)),
        child: ClipOval(
          child: CustomImageWidget(
            image:
                '${Get.find<SplashController>().configModel!.baseUrls!.vendorImageUrl}'
                '/${(profileController.profileModel != null && Get.find<AuthController>().isLoggedIn()) ? profileController.profileModel!.image ?? '' : ''}',
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        ),
      );
    });
  }
}
