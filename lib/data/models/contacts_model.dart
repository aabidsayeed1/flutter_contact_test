class ContactModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  ContactModel({this.id, this.firstName, this.lastName, this.email, this.dob});

  ContactModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    dob = json['dob'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['dob'] = dob;
    return data;
  }
}
