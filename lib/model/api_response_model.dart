class ApiResponseModel<T> {
  bool error;
  String? message;
  T? data;

  ApiResponseModel({required this.error, this.message, this.data});
}