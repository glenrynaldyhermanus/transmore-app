import '../database.dart';

class OptionsViewTable extends SupabaseTable<OptionsViewRow> {
  @override
  String get tableName => 'options_view';

  @override
  OptionsViewRow createRow(Map<String, dynamic> data) => OptionsViewRow(data);
}

class OptionsViewRow extends SupabaseDataRow {
  OptionsViewRow(super.data);

  @override
  SupabaseTable get table => OptionsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get key => getField<int>('key');
  set key(int? value) => setField<int>('key', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);
}
