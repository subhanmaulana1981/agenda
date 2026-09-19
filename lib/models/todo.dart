class Todo {
  /* properties */
  final String id;
  final String title;
  final bool isCompleted;

  /* konstruksi */
  Todo(this.id, this.title, this.isCompleted);

  /* methodes */
  // 1. from json
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(json['id'], json['title'], json['completed']);
  }
}
