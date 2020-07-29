import 'package:did_front/api_paths.dart';
import 'package:did_front/models/request_user_info.dart';
import 'package:did_front/services/networking.dart';

class CredentialHelper {
  CredentialHelper({this.connectionId});
  String connectionId;

  Future<CredentialRequestInfo> getCredentialRequestInfo() async {
    try {
      NetworkHelper userHelper = NetworkHelper('${apiUser}/${connectionId}');
      dynamic body = await userHelper.getData();
      print(body);
      CredentialRequestInfo credInfo = CredentialRequestInfo.fromJson(body);
      return credInfo;
    } catch (e) {
      print(e);
    }
  }
}
