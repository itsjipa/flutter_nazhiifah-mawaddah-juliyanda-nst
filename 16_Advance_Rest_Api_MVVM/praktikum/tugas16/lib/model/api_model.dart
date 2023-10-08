class APIModel {
  String? id;
  String? name;
  String? job;
  String? createAt;

  APIModel(this.id, this.name, this.job, this.createAt);

  APIModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    job = json['job'];
    createAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['job'] = job;
    data['created_at'] = createAt;
    return data;
  }
}
