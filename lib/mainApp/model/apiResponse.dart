class ApiResponse{
  bool error;
  String? message;
  dynamic data;

  ApiResponse({
    this.error = true,
    this.message,
    this.data
});
}