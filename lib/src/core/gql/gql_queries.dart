part of '../core.dart';

class GqlQuery {
  String charactersQuery = '''
  query (\$page: Int!){
    characters(page: \$page){
      info {
        next
      }
      results{
        id
        name
      }
    }
  }
  ''';

  String singleCharacterQuery = '''
  query (\$id: ID!){
    character(id: \$id){
      name
      image
      species
      gender
      status
    }   
  }
  ''';

  String locationsQuery = '''
  query (\$page: Int!){
    locations(page: \$page){
      info {
        next
      }
      results{
        name
        id
      }
    }
  }
  ''';

  String singleLocationQuery = '''
  query (\$id: ID!){
    location(id: \$id){
      name
      type
      dimension
      created
    }   
  }
  ''';
}
