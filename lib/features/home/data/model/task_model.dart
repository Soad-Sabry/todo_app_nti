class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime time;

  Task({this.id, required this.title, required this.description, required this.time});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "time": time.toIso8601String(),
    };
  }
}
