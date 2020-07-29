import 'package:did_front/api_paths.dart';
import 'package:did_front/services/networking.dart';

class SchemaHelper {
  Future<List<String>> retrieveSchemaInfo() async {
    try {
      NetworkHelper networkHelper = NetworkHelper('${apiSchema}');
      dynamic body = await networkHelper.getData();
      dynamic schemaIDs = body['schema_ids'];
      List<String> result = List();

      for(var schemaID in schemaIDs){
        result.add(schemaID);
      }
      return result;
    } catch (e) {
      print(e);
    }
  }
}
