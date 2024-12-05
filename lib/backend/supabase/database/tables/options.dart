import '../database.dart';

class OptionsTable extends SupabaseTable<OptionsRow> {
  @override
  String get tableName => 'options';

  @override
  OptionsRow createRow(Map<String, dynamic> data) => OptionsRow(data);
}

class OptionsRow extends SupabaseDataRow {
  OptionsRow(super.data);

  @override
  SupabaseTable get table => OptionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get type => getField<String>('type')!;
  set type(String value) => setField<String>('type', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  int get key => getField<int>('key')!;
  set key(int value) => setField<int>('key', value);
}
