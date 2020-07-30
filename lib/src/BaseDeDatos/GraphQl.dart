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



const String readRepositories = r'''
  query MyQuery {
  users {
    id
    name
    password
    phone
  }
}
''';

final QueryOptions options = QueryOptions(
    documentNode: gql(readRepositories),
    // variables: <String, dynamic>{
      
    // },
);


// ####### mutacion #######

final String _insertUser = r"""
  mutation insertUser($tockenUser : String, $country : String, $email: String, $name: name, $pass:String, $phone:String, $extendphone:String, $avatar:String) {
  insert_users_one(object:{
    tockenUser : $tockenUser
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

  ejecutar()async{
    final QueryResult result = await _client.query(options);
    if (result.hasException) {
        print(result.exception.toString());
    }

    final repositories = result.data;
    print("### $repositories");
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
        "tockenUser"    : userId,
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


}