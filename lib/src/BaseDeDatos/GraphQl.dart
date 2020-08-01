import 'package:graphql/client.dart';

final HttpLink _httpLink = HttpLink(
    uri: 'https://guimy-data.herokuapp.com/v1/graphql',
    headers: {
      "content-type":"application/json",
      "x-hasura-admin-secret":"1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik,9ol.0p"
    }
);
String token = "1qaz2wsx3edc4rfv5tgb6yhn7ujm8ik,9ol.0p";

final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
);

final Link _link = _authLink.concat(_httpLink);

final GraphQLClient _client = GraphQLClient(
        cache: InMemoryCache(),
        link: _link,
    );

// ################# query

const String readRepositories = r'''
  query MyQuery ( $token: String){
  users(where: {tokenUser: {_eq: $token}}) {
    id
    name
    password
    phone
    extend_phone
    email
    avatar
  }
}
''';

const String readRestaurant = r'''
  query MyQuery($_restaurantuid: uuid!) {
  restaurant_categories(where: {restaurant: {_eq: $_restaurantuid}}) {
    category
    restaurant
    information {
      name
      logo
      description
    }
  }
  restaurants_by_pk(id: $_restaurantuid) {
    email
    id
    latitude
    longitude
    logo
    name
    phone
    details
  }
}

''';

const String readMissions = r'''
  query MyQuery {
    misions {
      gives_points
      name
      id
      needs_action
      needs_total
    }
  }
''';



// ####### mutacion #######

final String _insertUser = r"""
  mutation insertUser($tokenUser : String, $country : String, $email: String, $name: name, $pass:String, $phone:String, $extendphone:String, $avatar:String) {
  insert_users_one(object:{
    tokenUser : $tokenUser
    country : $country
    email: $email
    name : $name
    password : $pass
    phone : $phone
    extend_phone : $extendphone
    avatar : $avatar
  }){
    id
    email
    name
  }
}
  """;







class GraphQLClass {

  ejecutarConsultaInicio(String token)async{

    final QueryOptions options = QueryOptions(
        documentNode: gql(readRepositories),
        variables: <String, dynamic>{
          "token" : token
        },
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException) {
        print(result.exception.toString());
    }
    print("### ${result.data}");
    final Map repositories = result.data["users"][0];
    print("### $repositories");

    return repositories;
  }

  insertarUsuario(
    String userId,
    String userAvatar,
    String userName,
    String userPassword,
    String extencionPhone,
    String userPhone,
    String userCountry,
    String userEmail,
  )async{

    final MutationOptions options = MutationOptions(
      documentNode: gql(_insertUser),
      variables: <String, dynamic>{
        "tokenUser"     : userId,
        "country"       : userCountry,
        "email"         : userEmail,
        "name"          : userName,
        "pass"          : userPassword,
        "phone"         : userPhone,
        "extendphone"   : extencionPhone,
        "avatar"        : userAvatar
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
        print(result.exception.toString());
        
        return;
    }
    print(result.data);

    // final bool isStarred =
    //     result.data['action']['starrable']['viewerHasStarred'] as bool;

    // if (isStarred) {
    //   print('Thanks for your star!');
    //   return;
    // }


  }

  consultarRestaurante(String idRest)async{
    final QueryOptions options = QueryOptions(
        documentNode: gql(readRestaurant),
        variables: <String, dynamic>{
          "_restaurantuid" : idRest
        },
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException) {
        print(result.exception.toString());
    }
    // print("### resultado restaurante: ${result.data}");
    // final List restaurant_categories = result.data["restaurant_categories"];
    // print("### mapa restaurante: $restaurant_categories");
    // final Map restaurants_by_pk = result.data["restaurants_by_pk"];
    // print("### mapa restaurante: $restaurants_by_pk");
    Map resultado = result.data;
    return resultado;
  }

  Future<Map> ejecutarConsultaMisiones()async{

    final QueryOptions options = QueryOptions(
        documentNode: gql(readMissions),
        // variables: <String, dynamic>{
        //   // "token" : token
        // },
    );

    final QueryResult result = await _client.query(options);
    if (result.hasException) {
        print(result.exception.toString());
    }
    print("### ${result.data}");
    final Map misiones = await result.data;
    print("### $misiones");

    return misiones;
  }


}