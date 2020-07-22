import 'package:flutter/material.dart';
import 'package:guimyapp/src/Pages/AuthUser/LoginUser.dart';
import 'package:guimyapp/src/Pages/AuthUser/RegisterUser.dart';
import 'package:guimyapp/src/Pages/SplashPage.dart';
import 'package:guimyapp/src/PreferensUser/PreferenciasUsuario.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/Templates/HomePage.dart';
import 'package:guimyapp/src/root/root.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
 

 final HttpLink httplink = HttpLink(uri: "https://guimy-data.herokuapp.com/v1/graphql",
  headers: {
    "content-type"          : "application/json",
    "x-hasura-admin-secret" : "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik,9ol.0p"
  }
); 
void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ValueNotifier<GraphQLClient> client = new ValueNotifier<GraphQLClient>(
      GraphQLClient(
        cache: InMemoryCache(),
        link: httplink, 
      )
    );

    return GraphQLProvider(
      client: client,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => new ModelProvider()),
        ],
        child: MaterialApp(
          title: 'Guimy',
          debugShowCheckedModeBanner: false,
          initialRoute: "/splash",
          routes: {
            "/splash"   : (BuildContext context) => SplashPage(),
            "/ourRoot"  : (BuildContext context) => OurRoot(),
            "/Login"    : (BuildContext context) => LoginUser(),
            "/Register" : (BuildContext context) => RegisterUser(),
            "/homePage" : (BuildContext context) => HomePage(),
          },
        ),
      ),
    );
  }
}