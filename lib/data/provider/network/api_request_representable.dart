enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

abstract class APIRequestRepresentable {
  String get url;
  String get baseUrl;
  String get endPoint;
  HTTPMethod get method;
  Map<String, String>? get headers;
  Map<String, dynamic>? get query;
  dynamic get body;
  Future request();
}
