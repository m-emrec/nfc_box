abstract class DataState<T> {
  final String? exception;
  final T? data;

  DataState({
    this.exception,
    this.data,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(exception) : super(exception: exception);
}
