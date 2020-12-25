import 'package:alim_freight_app/locators/locator.dart';
import 'package:alim_freight_app/web_ui/my_web_app.dart';
import 'package:flutter/material.dart';
import 'package:alim_freight_app/constants.dart';
import 'package:appwrite/appwrite.dart';

final Client client = Client();
final Account account = Account(client);
final Database database = Database(client);
final String userIdAppWrite = "Here is should be user";

void main() async {
  getIt.initializeServices();
  runApp(MaterialApp(home: App()));
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    authAppwrite();
    responseAppWrite();
    final w = MediaQuery.of(context).size.width;
    return w > 620 ? MyWebApp() : MyWebApp(); //MyApp();
  }

  Future<void> authAppwrite() async{
    client.setEndpoint(endpoint) // Your Appwrite Endpoint
        .setProject(projectId) // Your project ID
        .setSelfSigned();
  }

  Future<void> responseAppWrite() async {
    Future result = account.createSession(
      email: 'test@test.com',
      password: '12345678',
    );

    result
        .then((response) {
      print(response);
    }).catchError((error) {
      print(error);
    });

    /* Response user = await account
      .create(
      email: 'yufreeddom@gmail.com',
      password: '123456',
      name: 'Proba'
  );*/
  }

}





