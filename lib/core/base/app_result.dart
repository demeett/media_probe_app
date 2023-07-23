class AppResult<T> {
  final T? data;
  final Object? error;

  AppResult._({
    this.data,
    this.error,
  });

  factory AppResult.fromSuccess(T data) {
    return AppResult._(data: data, error: null);
  }

  factory AppResult.fromError(Object? error) {
    return AppResult._(data: null, error: error);
  }

  bool get isSucces => data != null && error == null;
  bool get isError => data == null && error != null;
}
