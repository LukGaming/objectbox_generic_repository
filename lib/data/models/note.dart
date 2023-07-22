import 'package:objectbox/objectbox.dart';
import 'package:test_mobx/data/models/abstract_base_model.dart';

@Entity()
class Note extends ObjectBoxBaseModel {
  String title;
  String body;
  Note({
    required String? id,
    required int? objId,
    required this.title,
    required this.body,
  }) : super(id: id, objId: objId);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
