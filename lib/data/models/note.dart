import 'package:objectbox/objectbox.dart';

@Entity()
class Note {
  @Id()
  int? id;
  String title;
  String body;
  Note({
    this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
