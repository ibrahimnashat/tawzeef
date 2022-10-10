class StateModel {
  int? id;
  String? state;

  StateModel({this.id, this.state});

  StateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['state'] = state;
    return data;
  }
}
