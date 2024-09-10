import 'package:gazzer_vendorapp/features/profile/domain/models/profile_model.dart';
import 'package:gazzer_vendorapp/interface/repository_interface.dart';

abstract class ForgotPasswordRepositoryInterface
    implements RepositoryInterface {
  Future<dynamic> forgotPassword(String? email);

  Future<dynamic> verifyToken(String? email, String token);

  Future<dynamic> changePassword(ProfileModel userInfoModel, String password);

  Future<dynamic> resetPassword(String? resetToken, String? email,
      String password, String confirmPassword);
}
