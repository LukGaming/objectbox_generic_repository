import 'package:objectbox/objectbox.dart';
import 'package:test_mobx/data/models/abstract_base_model.dart';

@Entity()
class Note implements AbstractObjectBoxBaseModel {
  @override
  @Id()
  int? objId;
  @override
  String? id;
  String title;
  String body;
  Note({
    required this.id,
    required this.objId,
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
