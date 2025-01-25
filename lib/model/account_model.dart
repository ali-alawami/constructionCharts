class AccountModel {
  String? id;
  String? date;
  String? accountName;
  String? value;
  String? description1;
  String? notes;

  AccountModel(
      {this.id,
      this.date,
      this.accountName,
      this.value,
      this.description1,
      this.notes});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['dateAsString'];
    accountName = json['accountName'];
    value = json['value'];
    description1 = json['description1'];
    notes = json['notes'];
  }
}
