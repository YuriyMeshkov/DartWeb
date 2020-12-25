import 'package:alim_freight_app/constants.dart';
import 'package:appwrite/appwrite.dart';



class AuthState  {
Client client = Client();
Account account;

   AuthState() {
     _init();
   }

   _init() {
     client.setEndpoint(endpoint)
         .setProject(projectId);
      account = Account(client);
     
   }
   login({String email,String password}) async {
     try {
       Response result = await account.createSession(email: email, password: password);
     } catch (e) {
       print(e);
     }
   }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}