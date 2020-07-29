import 'package:did_front/screens/connection_list_screen.dart';
import 'package:did_front/services/invitation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const id = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Invitation invitation = new Invitation();
  QrImage qrImage;
  bool viewQrCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DID Issuer"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Text("Issue Credential"),
              FlatButton(
                onPressed: () async {
                  QrImage qrImageTemp = await invitation.makeInvitation();
                  setState(() {
                    qrImage = qrImageTemp;
                    viewQrCode = true;
                  });
                },
                child: Text("초대 만들기"),
              ),
              viewQrCode ? qrImage : SizedBox(width: 0.0, height: 0.0),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, ConnectionListScreen.id);
                },
                child: Text("커넥션 목록 보기"),
              )
            ],
          ),
        ));
  }
}
