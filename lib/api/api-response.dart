class ApiResponse<T> {

  String code;
  String message;
  T? data;

  ApiResponse(this.code, this.message, {this.data = null});
}