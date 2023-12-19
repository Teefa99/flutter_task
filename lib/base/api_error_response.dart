class ApiErrorResponse {
  List<Errors>? errors = [];

  bool get hasErrorMessage => errors!.first.message?.isNotEmpty ?? false;
  ApiErrorResponse({this.errors});

  ApiErrorResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      errors = <Errors>[];
      json['data'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
    if (json['errors'] != null) {
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (errors != null) {}
    return data;
  }
}

class Errors {
  String? message;

  Errors({this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
