import 'package:did_front/screens/issue_screen.dart';
import 'package:did_front/services/connection.dart';
import 'package:flutter/material.dart';

class ConnectionListScreen extends StatefulWidget {
  static const id = "ConnectionListScreen";

  @override
  _ConnectionListScreenState createState() => _ConnectionListScreenState();
}

class _ConnectionListScreenState extends State<ConnectionListScreen> {
  ConnectionHelper connHelper = new ConnectionHelper();
  List<Connection> connList = List();
  void loadConnections() async {
    List<Connection> _connList = await connHelper.getConnList();
    setState(() {
      connList = _connList;
    });
  }

  void initState() {
    super.initState();
    loadConnections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("연결 목록"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: connList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  Expanded(child: Text(connList[index].theirLabel)),
                  Expanded(child: Text(connList[index].connId)),
                  RaisedButton(
                    child: Text("신원 발급하기"),
                    onPressed: () {
                      Navigator.pushNamed(context, IssueScreen.id,
                          arguments: {'connectionId': connList[index].connId});
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
