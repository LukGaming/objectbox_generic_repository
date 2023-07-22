import 'package:objectbox/objectbox.dart';

abstract class ObjectBoxBaseModel {
  @Id()
  int? objId;
  String? id;
  ObjectBoxBaseModel({required this.id, required this.objId});
}
