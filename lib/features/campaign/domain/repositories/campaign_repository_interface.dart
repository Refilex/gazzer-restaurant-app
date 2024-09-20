import 'package:gazzer_vendorapp/interface/repository_interface.dart';

abstract class CampaignRepositoryInterface implements RepositoryInterface {
  Future<dynamic> joinCampaign(int? campaignID);

  Future<dynamic> leaveCampaign(int? campaignID);
}
