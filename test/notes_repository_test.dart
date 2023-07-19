import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_mobx/data/models/note.dart';
import 'package:test_mobx/data/repository/object_box_base_repository_imp.dart';
import 'package:test_mobx/objectbox.g.dart';

void main() async {
  final directory = await Directory.systemTemp.createTemp();
  final store = await openStore(directory: directory.path);
  final noteBox = store.box<Note>();

  final _notesRepository = NotesRepository(
    noteBox,
    Note_.id,
  );

  test("creating a note", () async {
    final Note note = Note(title: "title", body: "body");
    await _notesRepository.create(note);
  });

  test("get notes", () async {
    List<Note> createdNotes = await _notesRepository.getAll();
    expect(createdNotes, isNotEmpty);
  });

  test("get an noteBy iD", () async {
    final Note noteToCreate = Note(
      title: "title",
      body: "body",
    );
    int createdNoteId = await _notesRepository.create(noteToCreate);
    DateTime initialTime = DateTime.now();
    Note getNote = await _notesRepository.getById(createdNoteId);
    DateTime finalTime = DateTime.now();
    print("Diferenca: ${finalTime.difference(initialTime).inMilliseconds}");
  });

  test("delete an note", () async {
    final Note note = Note(title: "title", body: "body");
    int createdNoteId = await _notesRepository.create(note);

    await _notesRepository
        .delete(await _notesRepository.getById(createdNoteId));
  });

  test("get an note by title", () async {
    final Note note = Note(
      title: "note by title",
      body: "body",
    );
    int createdNoteId = await _notesRepository.create(note);

    List<Note> notesByTitle = await _notesRepository.getNotesByTitle(
      "note by title",
    );

    expect(notesByTitle.length, 1);
    expect(notesByTitle.first.title, "note by title");
  });

  test("get an non existent note", () async {
    final Note note = Note(
      title: "note by title",
      body: "body",
    );

    int createdNoteId = await _notesRepository.create(note);

    expect(
      () async => await _notesRepository.getById(1998889),
      throwsA(isA<Exception>()),
    );
  });

  test("get note by body", () async {
    const bodyText = "body test";
    final Note note = Note(
      title: "note by title",
      body: bodyText,
    );

    int createdNoteId = await _notesRepository.create(note);

    List<Note> notesByBody = await _notesRepository.getNotesByBody(bodyText);
  });

  test("should delete all notes", () async {
    const bodyText = "body test";
    for (int i = 0; i < 1000; i++) {
      final Note note = Note(
        title: "note by title",
        body: bodyText,
      );

      await _notesRepository.create(note);
    }

    List<Note> createdNotes = await _notesRepository.getAll();

    expect(createdNotes.length, greaterThanOrEqualTo(1000));

    await _notesRepository.deleteAll();

    List<Note> getAllNotes = await _notesRepository.getAll();

    expect(getAllNotes, isEmpty);
  });
}
