import 'package:graphql_flutter/graphql_flutter.dart';
import 'fragments.dart';

class PublicGQLQuery {
  static final productSearch = gql(
      '''
query productSearch(\$term: String!, \$amount: Int!) {
  products(filter: {search: \$term}, channel: "default-channel", first: \$amount) {
    edges {
      node {
        ...productFields
      }
    }
  }
}

${Fragments.productFields}
''');

  static final collectionSearch = gql(
      r'''
query collectionSearch($term: String!, $amount: Int!) {
  collections(filter: {search: $term}, first: $amount) {
    edges {
      node {
        id
        name
        description
        backgroundImage {
          url
        }
      }
    }
  }
}
''');

  static final categorySearch = gql(
      r'''
query categorySearch($term: String!, $amount: Int!) {
  categories(filter: {search: $term}, first: $amount) {
    edges {
      node {
        id
        name
        description
        backgroundImage {
          url
        }
      }
    }
  }
}
''');

  static final productsQuery = gql(
      """
query getProducts(\$first: Int!, \$channel: String!, \$after:String, \$before:String) {
  products(first: \$first, channel: \$channel, after: \$after, before:\$before) {
    edges {
      node {
        ...productFields
      }
    }
    totalCount
    pageInfo{
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
  }
}

${Fragments.productFields}
""");

  static final singleProductQuery = gql(
      """
query getProduct(\$id: ID!, \$channel: String!) {
  product(id: \$id, channel: \$channel) {
    ...productFields
  }
}

${Fragments.productFields}
""");
  static final categoriesQuery = gql(
      """
query getCategories(\$amount: Int!, \$channel: String!, \$amountOfProducts: Int!, \$after: String, \$before: String) {
  categories(first: \$amount, after: \$after, before: \$before, level: 0) {
    edges {
      node {
        id
        name
        description
        backgroundImage {
          url
        }
        parent {
          id
          name
          description
          backgroundImage {
            url
          }
        }
        children(first:10) {
          edges {
            node {
              id
              name
              description
              backgroundImage {
                url
              }
              parent {
                id
                name
                description
                backgroundImage {
                  url
                }
              }
            }
          }
        }
        products(first: \$amountOfProducts, channel: \$channel) {
          edges {
            node {
              ...productFields
            }
          }
        }
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
${Fragments.productFields}
""");

  static final singleCategoryFiltered = gql(
      """
query getSingleCategoryFiltered(\$id: ID!,
  \$channel: String!,
  \$amountOfProducts: Int!,
  \$gte:Float,
  \$lte:Float,
  \$direction:OrderDirection!,
  \$field: ProductOrderField,
  \$after: String,
  \$before: String) {
  category(id: \$id) {
    id
    name
    description
    backgroundImage {
      url
    }
    products(
      first: \$amountOfProducts,
      channel: \$channel,
      filter:{
        price:{
          gte:\$gte
          lte:\$lte
        }
      }
      sortBy:{
        direction:\$direction
        field:\$field
      }
      after:\$after,
      before:\$before
    ) {
      edges {
        node {
          ...productFields
        }
      }
      totalCount
      pageInfo{
        hasNextPage
        hasPreviousPage
        startCursor
        endCursor
      }
    }
  }
}

${Fragments.productFields}
""");

  static final singleCollectionQuery = gql(
      '''
query getSingleCollection(\$id: ID!, \$amountOfProducts: Int!, \$after: String, \$before: String) {
  collection(id: \$id) {
    metafield(key: "list")
    id
    name
    description
    backgroundImage {
      url
    }
    translation(languageCode: EN) {
      id
      name
      description
    }
    products(first: \$amountOfProducts, after: \$after, before: \$before) {
      edges {
        node {
          ...productFields
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
}

${Fragments.productFields}
''');

  static final multiCollectionQuery = gql(
      '''
query getCollection(\$amount: Int!, \$amountOfProducts: Int!, \$after: String, \$before: String) {
  collections(first: \$amount, after: \$after, before: \$before) {
    totalCount
    pageInfo {
      hasNextPage
      hasPreviousPage
      startCursor
      endCursor
    }
    edges {
      node {
        metafield(key: "list")
        id
        name
        description
        backgroundImage {
          url
        }
        translation(languageCode: EN) {
          id
          language {
            code
            language
          }
          name
          description
        }
        products(first: \$amountOfProducts) {
          edges {
            node {
              ...productFields
            }
          }
        }
      }
    }
  }
}

${Fragments.productFields}
''');

  static final singleCategoryQuery = gql(
      """query getSingleCategory(\$id: ID!, \$channel: String!, \$amountOfProducts: Int!, \$after: String, \$before: String) {
  category(id: \$id) {
    id
    name
    description
    backgroundImage {
      url
    }
    children(first:10) {
          edges {
            node {
              id
              name
              description
              backgroundImage {
                url
              }
              parent {
                id
                name
                description
                backgroundImage {
                  url
                }
              }
            }
          }
        }
    products(first: \$amountOfProducts, channel: \$channel, after:\$after, before:\$before) {
      edges {
        node {
          ...productFields
        }
      }
      totalCount
      pageInfo{
        hasNextPage
        hasPreviousPage
        startCursor
        endCursor
      }
    }
  }
}

${Fragments.productFields}
""");
}
