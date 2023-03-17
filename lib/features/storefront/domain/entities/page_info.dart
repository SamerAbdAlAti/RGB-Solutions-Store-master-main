// ignore_for_file: public_member_api_docs, sort_constructors_first
class PageInfo {
  int totalCount;
  bool hasNextPage;
  bool hasPreviousPage;
  String startCursor;
  String endCursor;
  PageInfo({
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.startCursor,
    required this.endCursor,
  });

  @override
  bool operator ==(covariant PageInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.totalCount == totalCount &&
      other.hasNextPage == hasNextPage &&
      other.hasPreviousPage == hasPreviousPage &&
      other.startCursor == startCursor &&
      other.endCursor == endCursor;
  }

  @override
  int get hashCode {
    return totalCount.hashCode ^
      hasNextPage.hashCode ^
      hasPreviousPage.hashCode ^
      startCursor.hashCode ^
      endCursor.hashCode;
  }
}
