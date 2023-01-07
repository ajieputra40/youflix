class ApiReturnValue<T> {
  final int status;
  final T value;
  final String message;

  ApiReturnValue({required this.status, required this.message, required this.value});
}
