class TodoModel {
  String? id;
  String? image;
  String? title;
  String? description;
  String? priority;
  String? status;
  String? date;

  TodoModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.priority,
    this.status,
    this.date,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    title = json['title'];
    description = json['desc'];
    priority = json['priority'];
    status = json['status'];
    date = json['createdAt'];
  }
}
