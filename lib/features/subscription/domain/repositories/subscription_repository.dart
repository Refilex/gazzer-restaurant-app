import 'package:gazzer_vendorapp/api/api_client.dart';
import 'package:gazzer_vendorapp/features/subscription/domain/repositories/subscription_repository_interface.dart';
import 'package:gazzer_vendorapp/util/app_constants.dart';
import 'package:get/get.dart';

class SubscriptionRepository implements SubscriptionRepositoryInterface {
  final ApiClient apiClient;

  SubscriptionRepository({required this.apiClient});

  @override
  Future<Response> renewBusinessPlan(
      Map<String, String> body, Map<String, String>? headers) async {
    return await apiClient.postData(AppConstants.renewBusinessPlanUri, body,
        headers: headers);
  }

  @override
  Future add(value) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future delete({int? id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future getList() {
    // TODO: implement getList
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
