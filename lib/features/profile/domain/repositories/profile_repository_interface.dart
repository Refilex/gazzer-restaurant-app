import 'package:gazzer_vendorapp/interface/repository_interface.dart';
import 'dart:async';
import 'package:gazzer_vendorapp/features/profile/domain/models/profile_model.dart';
import 'package:image_picker/image_picker.dart';

abstract class ProfileRepositoryInterface implements RepositoryInterface {
  Future<dynamic> getProfileInfo();

  void setNotificationActive(bool isActive);

  bool isNotificationActive();

  String getUserToken();

  Future<bool> updateProfile(
      ProfileModel userInfoModel, XFile? data, String token);
}
