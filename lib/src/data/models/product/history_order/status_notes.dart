class StatusNotes {
  String? id;
  String? orderId;
  String? statusId;
  String? description;
  String? createdAt;

  StatusNotes({
    this.id,
    this.orderId,
    this.statusId,
    this.description,
    this.createdAt,
  });

  StatusNotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    statusId = json['status_id'];
    description = json['description'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['status_id'] = statusId;
    data['description'] = description;
    data['created_at'] = createdAt;
    return data;
  }
}
