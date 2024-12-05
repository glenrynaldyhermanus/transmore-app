import '../database.dart';

class FormPagesTable extends SupabaseTable<FormPagesRow> {
  @override
  String get tableName => 'form_pages';

  @override
  FormPagesRow createRow(Map<String, dynamic> data) => FormPagesRow(data);
}

class FormPagesRow extends SupabaseDataRow {
  FormPagesRow(super.data);

  @override
  SupabaseTable get table => FormPagesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  String get formId => getField<String>('form_id')!;
  set formId(String value) => setField<String>('form_id', value);
}
