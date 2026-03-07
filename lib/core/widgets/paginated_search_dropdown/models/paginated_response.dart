class PaginatedResponse<T> {
  final List<T> data;
  final int totalCount;
  final int currentPage;
  final bool hasMore;

  const PaginatedResponse({
    required this.data,
    required this.totalCount,
    required this.currentPage,
    required this.hasMore,
  });

  factory PaginatedResponse.fromPage({
    required List<T> data,
    required int totalCount,
    required int currentPage,
    required int pageSize,
  }) {
    final hasMore = currentPage * pageSize < totalCount;

    return PaginatedResponse(
      data: data,
      totalCount: totalCount,
      currentPage: currentPage,
      hasMore: hasMore,
    );
  }
}
