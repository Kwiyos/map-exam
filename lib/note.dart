class Note {
  final dynamic id;
  String? title;
  String? content;

  Note({this.id = 0, this.title = '', this.content = ''});

  Note.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], title: json['title'], content: json['content']);

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'content': content};

  Note copyWith({
    dynamic id,
    String? title,
    String? content,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
