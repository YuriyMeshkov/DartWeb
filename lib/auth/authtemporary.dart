
import 'package:alim_freight_app/constants.dart';
import 'package:appwrite/appwrite.dart';
import 'package:alim_freight_app/main.dart';


class AuthAppWrite {

  void authAppwrite() {
    client.setEndpoint(endpoint) // Your Appwrite Endpoint
        .setProject(projectId) // Your project ID
        .setSelfSigned();
  }

  Future<void> responseAppWrite() async {
    Response user = await account.create(
        email: 'yufreeddom@gmail.com',
        password: '123456',
        name: 'Proba'
    );
  }

  Future<void> createSessionAppWrite() async {
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
  }
}
