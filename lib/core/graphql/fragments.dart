class Fragments {
  static const userNoOrderFields = '''
fragment userData on User {
  id
  email
  firstName
  lastName
  isStaff
  isActive
  checkoutIds
  checkouts(first: 1) {
    edges {
      node {
        ...checkoutFields
      }
    }
  }
  
  userPermissions {
    code
    name
  }
  addresses {
    ...addressFields
  }
}
$checkoutFields
$addressFields
''';

  static const userFields = '''
fragment userData on User {
  id
  email
  firstName
  lastName
  isStaff
  isActive
  checkoutIds
  checkouts(first: 1) {
    edges {
      node {
        ...checkoutFields
      }
    }
  }
  orders(first:10){
    edges{
      node{
       ...orderFields 
      }
    }
  }
  userPermissions {
    code
    name
  }
  addresses {
    ...addressFields
  }
}
$checkoutFields
$userOrderFields
$addressFields
''';

  static const checkoutFields = '''
fragment checkoutFields on Checkout {
  id
  metafields
  lastChange
  created
  note
  subtotalPrice{
    gross{
      currency
      amount
    }
  }
  discount {
    currency
    amount
  }
  discountName
  translatedDiscountName
  voucherCode
  quantity
  shippingPrice {
    gross {
      currency
      amount
    }
  }
  totalPrice {
    gross {
      currency
      amount
    }
  }
  shippingMethods {
    id
    name
    description
    price {
      currency
      amount
    }
    maximumDeliveryDays
    minimumDeliveryDays
  }
  shippingAddress {
    firstName
    lastName
    streetAddress1
    streetAddress2
    city
    cityArea
    postalCode
    country {
      code
      country
    }
  }
  lines {
    id
    quantity
    variant {
      id
      name
      product {
        ...productFields
      }
    }
    unitPrice {
      gross {
        currency
        amount
      }
    }
    undiscountedUnitPrice {
      currency
      amount
    }
    totalPrice {
      gross {
        currency
        amount
      }
    }
  }
}
$productFields
''';

  static const addressFields = r'''
fragment addressFields on Address {
  id
  firstName
  lastName
  companyName
  streetAddress1
  streetAddress2
  city
  cityArea
  postalCode
  country {
    code
    country
  }
  countryArea
  phone
  isDefaultShippingAddress
  isDefaultBillingAddress
}
''';

  static const productFields = '''
fragment productFields on Product {
  id
  name
  description
  rating
  isAvailable
  defaultVariant {
    ...variantField
  }
  pricing {
    priceRange {
      start {
        gross {
          currency
          amount
        }
      }
    }
    priceRangeUndiscounted {
      start {
        gross {
          amount
          currency
        }
      }
    }
  }
  variants {
    ...variantField
  }
  attributes {
    attribute {
      ...attributeField
    }
    values {
      ...attributeValueField
    }
  }
  weight {
    unit
    value
  }
  thumbnail {
    url
  }
  category {
    id
    name
    description
    backgroundImage {
      url
    }
  }
  media {
    url
  }
}
$attributeValueFields
$attributeFields
$variantFields
''';

  static const attributeValueFields = r'''
fragment attributeValueField on AttributeValue {
  id
  name
  value
  inputType
  slug
  reference
  boolean
  richText
  plainText
}
''';

  static const attributeFields = r'''
fragment attributeField on Attribute {
  id
  name
  slug
  unit
}
''';

  static const variantFields = r'''
fragment variantField on ProductVariant {
  id
  name
  quantityAvailable
  quantityLimitPerCustomer
  weight {
    unit
    value
  }
  attributes {
    attribute {
      ...attributeField
    }
    values {
      ...attributeValueField
    }
  }
  media {
    url
  }
  pricing {
    onSale
    discount {
      gross {
        currency
        amount
      }
    }
    price {
      gross {
        currency
        amount
      }
    }
    priceUndiscounted {
      gross {
        currency
        amount
      }
    }
  }
}
''';

  static const userOrderFields = r'''
fragment orderFields on Order {
  id
  metafields
  created
  number
  status
  paymentStatus
  events {
    id
    date
    type
    message
  }
  userEmail
  total {
    gross {
      currency
      amount
    }
  }
  weight {
    unit
    value
  }
  user {
    id
    firstName
    lastName
  }
  shippingAddress {
    firstName
    lastName
    streetAddress1
    streetAddress2
    city
    cityArea
    postalCode
    country {
      code
      country
    }
  }
  lines {
    id
    productName
    productVariantId
    quantity
    thumbnail {
      url
    }
    unitPrice {
      gross {
        currency
        amount
      }
    }
    totalPrice {
      gross {
        currency
        amount
      }
    }
  }
}
''';
}