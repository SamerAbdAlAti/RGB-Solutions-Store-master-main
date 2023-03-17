import 'package:saleor_app_flutter/core/graphql/fragments.dart';

class OrderMutations {
  static const cancelOrder = r'''
mutation cancelOrder($id:ID!) {
  orderCancel(id: $id) {
    order {
      id
    }
    errors {
      message
      code
    }
  }
}
''';

  static const putOrder = '''
mutation setCheckoutMethod(\$id: ID!, \$metadata: [MetadataInput!], \$deliveryId:ID!){
  checkoutDeliveryMethodUpdate(id:\$id,deliveryMethodId: \$deliveryId){
    checkout{
      id
    }
  }
  
  orderCreateFromCheckout(id: \$id, metadata: \$metadata) {
    order {
      ...orderFields
    }
    errors{
      field
      message
      code
    }
  }
}
${Fragments.userOrderFields}
''';

  static const addEvent = '''
mutation addEvent(\$orderId: ID!, \$message: String!) {
  orderAddNote(order: \$orderId, input: {message: \$message}) {
    order {
      ...orderFields
    }
  }
}
${Fragments.userOrderFields}
''';
}
