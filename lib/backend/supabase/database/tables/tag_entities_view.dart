import '../database.dart';

class TagEntitiesViewTable extends SupabaseTable<TagEntitiesViewRow> {
  @override
  String get tableName => 'tag_entities_view';

  @override
  TagEntitiesViewRow createRow(Map<String, dynamic> data) =>
      TagEntitiesViewRow(data);
}

class TagEntitiesViewRow extends SupabaseDataRow {
  TagEntitiesViewRow(super.data);

  @override
  SupabaseTable get table => TagEntitiesViewTable();

  String? get entityId => getField<String>('entity_id');
  set entityId(String? value) => setField<String>('entity_id', value);

  String? get tagId => getField<String>('tag_id');
  set tagId(String? value) => setField<String>('tag_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get tagName => getField<String>('tag_name');
  set tagName(String? value) => setField<String>('tag_name', value);
}
