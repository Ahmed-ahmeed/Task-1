class ApiError {
  final String type;
  final String? value;
  final String msg;
  final String path;
  final String location;

  ApiError({
    required this.type,
    this.value,
    required this.msg,
    required this.path,
    required this.location,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      type: json['type'],
      value: json['value'],
      msg: json['msg'],
      path: json['path'],
      location: json['location'],
    );
  }
}
