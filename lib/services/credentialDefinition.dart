import 'package:did_front/api_paths.dart';
import 'package:did_front/services/networking.dart';

class CredentialDefinitionHelper {
  CredentialDefinitionHelper({this.schemaId});
  String schemaId;

  Future<String> getCredentialRequestInfo() async {
    try {
      NetworkHelper userHelper = NetworkHelper('${apiCreDef}?schema_id=${schemaId}');
      dynamic body = await userHelper.getData();
      String credDefId = body['credential_definition_ids'].toString();
      print(credDefId);
      return credDefId;
    } catch (e){
      print(e);
    }
  }
}
