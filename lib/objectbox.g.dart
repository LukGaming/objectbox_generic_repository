// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'data/models/note.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 59106407670064805),
      name: 'Note',
      lastPropertyId: const IdUid(4, 8338908895706908594),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 2374128579755138067),
            name: 'objId',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 5768294693863408066),
            name: 'id',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 3802702722057647853),
            name: 'title',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 8338908895706908594),
            name: 'body',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 59106407670064805),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Note: EntityDefinition<Note>(
        model: _entities[0],
        toOneRelations: (Note object) => [],
        toManyRelations: (Note object) => {},
        getId: (Note object) => object.objId,
        setId: (Note object, int id) {
          object.objId = id;
        },
        objectToFB: (Note object, fb.Builder fbb) {
          final idOffset =
              object.id == null ? null : fbb.writeString(object.id!);
          final titleOffset = fbb.writeString(object.title);
          final bodyOffset = fbb.writeString(object.body);
          fbb.startTable(5);
          fbb.addInt64(0, object.objId ?? 0);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, titleOffset);
          fbb.addOffset(3, bodyOffset);
          fbb.finish(fbb.endTable());
          return object.objId ?? 0;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Note(
              id: const fb.StringReader(asciiOptimization: true)
                  .vTableGetNullable(buffer, rootOffset, 6),
              objId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 4),
              title: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              body: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Note] entity fields to define ObjectBox queries.
class Note_ {
  /// see [Note.objId]
  static final objId = QueryIntegerProperty<Note>(_entities[0].properties[0]);

  /// see [Note.id]
  static final id = QueryStringProperty<Note>(_entities[0].properties[1]);

  /// see [Note.title]
  static final title = QueryStringProperty<Note>(_entities[0].properties[2]);

  /// see [Note.body]
  static final body = QueryStringProperty<Note>(_entities[0].properties[3]);
}
