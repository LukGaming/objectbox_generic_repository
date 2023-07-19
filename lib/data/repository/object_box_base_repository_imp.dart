import 'package:objectbox/internal.dart';
import 'package:test_mobx/data/models/note.dart';
import 'package:test_mobx/objectbox.g.dart';

abstract class IRepository<E> {
  Future<E> getById(int id);
  Future<List<E>> getAll();
  Future<int> create(E obj);
  Future<int> update(E obj);
  Future<void> delete(E entity);
  Future<void> deleteAll();
}

abstract class BaseRepository<E> implements IRepository<E> {
  final dynamic box;
  final QueryIntegerProperty<E> entityId;

  BaseRepository(this.box, this.entityId);

  @override
  Future<E> getById(int id) async {
    final query = box.query(entityId.equals(id)).build();
    final entities = query.find();
    if (entities.isEmpty) {
      throw Exception("Entity ${E} not found.");
    }
    return entities.first;
  }

  @override
  Future<List<E>> getAll() async {
    return box.getAll();
  }

  @override
  Future<int> create(E obj) async {
    return box.put(obj);
  }

  @override
  Future<int> update(E obj) async {
    return box.put(obj);
  }

  @override
  Future<void> delete(dynamic entity) async {
    box.remove(entity.id);
  }

  @override
  Future<void> deleteAll() async {
    List<E> allEntities = await getAll();
    for (int i = 0; i < allEntities.length; i++) {
      await delete(allEntities[i]);
    }
  }
}

class NotesRepository extends BaseRepository<Note> {
  NotesRepository(
    dynamic box,
    QueryIntegerProperty<Note> noteEntityId,
  ) : super(
          box,
          noteEntityId,
        );

  Future<List<Note>> getNotesByTitle(String title) async {
    final query = box.query(Note_.title.equals(title)).build();
    return query.find();
  }

  Future<List<Note>> getNotesByBody(String body) async {
    final query = box.query(Note_.body.equals(body)).build();
    return query.find();
  }
}
