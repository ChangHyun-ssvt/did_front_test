import 'package:did_front/api_paths.dart';
import 'package:did_front/services/networking.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Invitation {
  String _invitationUrl;
  String _invitationApi = apiMakeConn;

  Future<QrImage> makeInvitation() async {
    try {
      NetworkHelper networkHelper = NetworkHelper(_invitationApi);
      dynamic body = await networkHelper.postData();
      _invitationUrl = body['invitation_url'];
      return makeQrCode();
    } catch (e) {
      print(e);
    }
  }

  QrImage makeQrCode() {
    return QrImage(
      data: _invitationUrl,
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
