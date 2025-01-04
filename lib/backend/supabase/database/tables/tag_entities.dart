import '../database.dart';

class TagEntitiesTable extends SupabaseTable<TagEntitiesRow> {
  @override
  String get tableName => 'tag_entities';

  @override
  TagEntitiesRow createRow(Map<String, dynamic> data) => TagEntitiesRow(data);
}

class TagEntitiesRow extends SupabaseDataRow {
  TagEntitiesRow(super.data);

  @override
  SupabaseTable get table => TagEntitiesTable();

  String get entityId => getField<String>('entity_id')!;
  set entityId(String value) => setField<String>('entity_id', value);

  String get tagId => getField<String>('tag_id')!;
  set tagId(String value) => setField<String>('tag_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);
}
