import 'package:saleor_app_flutter/core/graphql/fragments.dart';

class OrderQuery {
  static const getReadyOrders = '''
query getReadyOrders(\$first: Int!, \$after: String) {
  orders(first: \$first, filter: {status: FULFILLED}, after: \$after) {
    edges {
      node {
        ...orderFields
      }
    }
    totalCount
    pageInfo {
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
  }
}

${Fragments.userOrderFields}
''';
}
