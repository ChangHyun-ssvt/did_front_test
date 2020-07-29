import 'package:did_front/api_paths.dart';
import 'package:did_front/services/networking.dart';
import 'package:flutter/cupertino.dart';

class Connection {
  Connection({@required this.connId, @required this.theirLabel});

  String connId;
  String theirLabel;
}

class ConnectionHelper {
  List<Connection> _connList = List();
  Future<List<Connection>> getConnList() async {
    try {
      print('api:${apiGetAllConn}');

      NetworkHelper networkHelper = NetworkHelper(apiGetAllConn);
      dynamic body = await networkHelper.getData();
      dynamic connections = body['results'];
      for (var conn in connections) {
        if (conn['state'] == 'response') {
          print(conn['connection_id']);
          Connection newConn = new Connection(
              connId: conn['connection_id'], theirLabel: conn['their_label']);
          _connList.add(newConn);
        }
      }
      print(_connList);
      return _connList;
    } catch (e) {
      print(e);
      return _connList;
    }
  }
}
