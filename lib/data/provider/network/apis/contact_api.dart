import 'dart:io';
import '../api_endpoint.dart';
import '../api_provider.dart';
import '../api_request_representable.dart';

enum ContactType { contact }

class ContactsAPI implements APIRequestRepresentable {
  final ContactType type;
  dynamic jsonData;

  ContactsAPI._({
    required this.type,
    required this.jsonData,
  });

  ContactsAPI.contacts(dynamic jsonData)
      : this._(type: ContactType.contact, jsonData: jsonData);

  @override
  String get baseUrl => APIEndpoint.baseUrl;

  @override
  String get endPoint {
    switch (type) {
      case ContactType.contact:
        return APIEndpoint.contachApi;

      default:
        return "";
    }
  }

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
  }

  @override
  Map<String, String> get headers => {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Accept": "application/json"
      };

  @override
  Map<String, dynamic> get query {
    return jsonData;
  }

  @override
  get body => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => baseUrl + endPoint;
}
