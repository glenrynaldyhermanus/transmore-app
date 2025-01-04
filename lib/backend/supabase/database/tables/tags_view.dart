import '../database.dart';

class TagsViewTable extends SupabaseTable<TagsViewRow> {
  @override
  String get tableName => 'tags_view';

  @override
  TagsViewRow createRow(Map<String, dynamic> data) => TagsViewRow(data);
}

class TagsViewRow extends SupabaseDataRow {
  TagsViewRow(super.data);

  @override
  SupabaseTable get table => TagsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  int? get typeKey => getField<int>('type_key');
  set typeKey(int? value) => setField<int>('type_key', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
