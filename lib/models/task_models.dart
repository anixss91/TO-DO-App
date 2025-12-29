class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
  // conver to json map for Saving
  Map<String, dynamic> toJson() => {'title': title, 'isDone': isDone};

  // Factory = "smart constructor" that decides what to return!

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(title: json['title'] as String, isDone: json['isDone'] as bool);
}
