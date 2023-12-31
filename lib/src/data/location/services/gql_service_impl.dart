part of '../location.dart';

class GraphQLServiceImpl implements GraphQLService {
  final GqlQuery _query;
  final GqlClient _gqlClient;

  GraphQLServiceImpl({
    required GqlClient gqlClient,
    required GqlQuery query,
  })  : _query = query,
        _gqlClient = gqlClient;

  @override
  Future<Map<String, dynamic>> getLocation(String id) async {
    try {
      final queryData = await _gqlClient.gqlClient.query(
        QueryOptions(
          document: gql(_query.singleLocationQuery),
          variables: {"id": id},
        ),
      );

      return queryData.data?['location'] as Map<String, dynamic>;
    } catch (err) {
      throw Exception(err);
    }
  }
}
