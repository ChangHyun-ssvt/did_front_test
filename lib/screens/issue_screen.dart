import 'package:did_front/models/request_user_info.dart';
import 'package:did_front/services/credential.dart';
import 'package:did_front/services/schema.dart';
import 'package:flutter/material.dart';

class IssueScreen extends StatefulWidget {
  static const id = "IssueScreen";

  @override
  _IssueScreenState createState() => _IssueScreenState();
}


class _IssueScreenState extends State<IssueScreen> {
  CredentialRequestInfo credInfo;
  List<String> schemaIds = List();
  List<String> credentialInfoKeys = List<String>();
  List<String> credentialInfoValues = List<String>();

  void loadCredentialInfo(String connectionId) async {
    CredentialHelper credHelper = CredentialHelper(connectionId: connectionId);
    SchemaHelper schemaHelper = SchemaHelper();

    List<String> _schmeIds = await schemaHelper.retrieveSchemaInfo();
    print(_schmeIds);

//    CredentialDefinitionHelper credentialDefinitionHelper = CredentialDefinitionHelper(schemaId: schemaIds[0]);
//
//    String credDefId = await credentialDefinitionHelper.getCredentialRequestInfo();

    CredentialRequestInfo _credInfo =
        await credHelper.getCredentialRequestInfo();

    setState(() {
      credInfo = _credInfo;
      schemaIds = _schmeIds;
      credentialInfoKeys = _credInfo.getKeys();
      credentialInfoValues = _credInfo.getValues();
    });
  }

  @override
  void initState()   {
    // TODO: implement initState
    super.initState();

    () async {
      await Future.delayed(Duration.zero, () {
        Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
        loadCredentialInfo(args['connectionId'] as String);
      });
    };

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("신원 발급")),
        body: Container(
            child: SafeArea(
                child: ListView.separated(
          padding: const EdgeInsets.all(8),
          itemCount: credInfo.getKeys().length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                Expanded(child: Text(credentialInfoKeys[index])),
                Expanded(child: Text(credentialInfoValues[index]))
              ],
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ))));
  }
}
