import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:guimyapp/src/Pages/Body/CuponBody.dart';
import 'package:guimyapp/src/Pages/Body/HomeBody.dart';
import 'package:guimyapp/src/Pages/Body/LocarionBody.dart';
import 'package:guimyapp/src/Pages/Body/NotificationBody.dart';
import 'package:guimyapp/src/Pages/Body/PerfilBody.dart';
import 'package:guimyapp/src/Pages/Body/RankCupBody.dart';
import 'package:guimyapp/src/Pages/Body/RankUserBody.dart';
import 'package:guimyapp/src/Pages/Body/RegaloBody.dart';
import 'package:guimyapp/src/Pages/Body/ReportarBody.dart';
import 'package:guimyapp/src/Pages/Body/StarBody.dart';
import 'package:guimyapp/src/Provider/ModelProvider.dart';
import 'package:guimyapp/src/Widgets/AppBarWidgetP.dart';
import 'package:guimyapp/src/Widgets/BottomBarWidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

String userId = "";
String readRepositories = """
  query MyQuery {
    users_by_pk(id: \$id) {
      id
      avatar
      email
      extend_phone
      name
      password
      phone
    }
  }
""";

/*
Query(
  options: QueryOptions(
    documentNode: gql(readRepositories), // this is the query string you just created
    variables: {
      'nRepositories': 50,
    },
    pollInterval: 10,
  ),
  // Just like in apollo refetch() could be used to manually trigger a refetch
  // while fetchMore() can be used for pagination purpose
  builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
    if (result.hasException) {
        return Text(result.exception.toString());
    }

    if (result.loading) {
      return Text('Loading');
    }

    // it can be either Map or List
    List repositories = result.data['viewer']['repositories']['nodes'];

    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repository = repositories[index];

        return Text(repository['name']);
    });
  },
);
*/

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    _cargarPreferencias();
    super.initState();
    
  }

  _cargarPreferencias()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = await prefs.getString("idUser")??"no data";
    print("## DATO RECUPERADO ## : $userId");
    //_cargarProvider();
  }

  _cargarProvider(){
    return Query(
      options: QueryOptions(
        documentNode: gql(readRepositories), // this is the query string you just created
        variables: {
          'id': userId,
        },
        // pollInterval: 10,
      ),
      // Just like in apollo refetch() could be used to manually trigger a refetch
      // while fetchMore() can be used for pagination purpose
      builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
        print(" !!!! #### idid $userId ");
        if (result.hasException) {
          print(" !!!! #### err0r 1 ");
          print(" !!!! #### err0r 1 ${result.exception.toString()} ");
            return Text(result.exception.toString());
        }

        if (result.loading) {
          print(" !!!! #### err0r 2 ");
          return Text('Loading');
        }

        // it can be either Map or List
        Map repositories = result.data['"data"']["users_by_pk"];
        
        print(repositories["id"]);
        print(repositories["avatar"]);
        print(repositories["email"]);
        print(repositories["extend_phone"]);
        print(repositories["name"]);
        print(repositories["password"]);
        print(repositories["phone"]);


        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final int index = Provider.of<ModelProvider>(context).indexPage;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              _cargarProvider(),
              _returnPage(index),
              Positioned(child: AppBarWidgetP(),top: 0.0,left: 0.0,),
              Positioned(child: BottomBarWidget(),bottom: 0.0,left: 0.0,),
              //Text("#######$index"),
            ],
          ),
        ),
        
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          elevation: 5.0,
          onPressed: (){},
          backgroundColor: Colors.white,
          child: FaIcon(FontAwesomeIcons.qrcode,color: Colors.red,),
        ),
        //bottomNavigationBar: BottomBarWidget(),
      ),
    );
  }

  Widget _returnPage(int index){
    switch (index) {
      case 0:
        return HomeBody();
        break;
      case 1:
        return StarBody();
        break;
      case 3:
        return LocationBody();
        break;
      case 4:
        return RankCupBody();
        break;
      case 5:
        return RegaloBody();
        break;
      case 6:
        return CuponBody();
        break;
      case 7:
        return NotificationBody();
        break;
      case 8:
        return PerfilBody();
        break;
      case 9:
        return RankUserBody();
        break;
      case 10:
        return ReportarBody();
        break;
      default:
        return HomeBody();
    }
  }
}