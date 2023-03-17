import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:saleor_app_flutter/core/graphql/fragments.dart';

class CheckoutMutations {
  static const addCheckoutLine = '''
mutation addCheckoutLine(\$id:ID!, \$variantId:ID!, \$quantity:Int!){
  checkoutLinesAdd(id:\$id, lines:{variantId:\$variantId, quantity:\$quantity}){
    checkout{
      ...checkoutFields
    }
    errors{
      code
      message
    }
  }
}
${Fragments.checkoutFields}
''';

  static const addCobon = '''
mutation addCobon(\$id: ID!, \$promoCode: String!) {
  checkoutAddPromoCode(id: \$id, promoCode: \$promoCode) {
    checkout {
      ...checkoutFields
    }
    errors {
      field
      message
      code
    }
  }
}
${Fragments.checkoutFields}
''';

  static const removeCobon = '''
mutation removeCobon(\$id: ID!, \$promoCode: String!) {
  checkoutRemovePromoCode(id: \$id, promoCode: \$promoCode) {
    checkout {
      ...checkoutFields
    }
    errors {
      field
      message
      code
    }
  }
}
${Fragments.checkoutFields}
''';

  static const deleteCheckoutLines = '''
mutation deleteCheckoutLines(\$id:ID!, \$linesIds:[ID!]!){
  checkoutLinesDelete(id:\$id, linesIds:\$linesIds){
    checkout{
      ...checkoutFields
    }
    errors{
      code
      message
    }
  }
}
${Fragments.checkoutFields}
''';

  static final setCheckoutAddress = gql('''
mutation setCheckoutAddress(\$firstName: String!, \$lastName: String!, \$street1: String!, \$street2: String, \$postcode: String!, \$city: String!, \$country: CountryCode, \$id: ID!, \$cityArea: String!) {
  checkoutBillingAddressUpdate(
    id: \$id
    billingAddress: {firstName: \$firstName, lastName: \$lastName, streetAddress1: \$street1, streetAddress2: \$street2, city: \$city, postalCode: \$postcode, country: \$country, cityArea: \$cityArea}
  ) {
    checkout {
      id
    }
  }
  checkoutShippingAddressUpdate(
    id: \$id
    shippingAddress: {firstName: \$firstName, lastName: \$lastName, streetAddress1: \$street1, streetAddress2: \$street2, city: \$city, postalCode: \$postcode, country: \$country, cityArea: \$cityArea}
  ) {
    checkout {
      ...checkoutFields
    }
    errors {
      lines
      variants
      field
      message
      code
    }
  }
}
${Fragments.checkoutFields}
''');

  static const createCheckout = '''
mutation createCheckout(\$quantity: Int!, \$variantId: ID!) {
  checkoutCreate(input: {lines: {quantity: \$quantity, variantId: \$variantId}}) {
    checkout {
      ...checkoutFields
    }
    errors{
      code
      message
    }
  }
}
${Fragments.checkoutFields}
''';

  static const updateCheckoutLines = '''
mutation updateCheckoutLines(\$checkoutId: ID!, \$lineId: ID!, \$quantity: Int!) {
  checkoutLinesUpdate(
    id: \$checkoutId
    lines: {lineId: \$lineId, quantity: \$quantity}
  ) {
    checkout {
      ...checkoutFields
    }
    errors{
      code
      message
    }
  }
}
${Fragments.checkoutFields}
''';
}
