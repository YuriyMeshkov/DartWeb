
class Permissions {
  String read;
  String write;

  Permissions({this.read, this.write});

  Permissions.fromJson(Map<String, dynamic> json) {
    read = json['read'] = this.read;
    write = json['write'] = this.read;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['read'] = "*";
    data['write'] = "*";
    return data;
  }
}