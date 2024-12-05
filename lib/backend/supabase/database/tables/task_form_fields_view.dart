import '../database.dart';

class TaskFormFieldsViewTable extends SupabaseTable<TaskFormFieldsViewRow> {
  @override
  String get tableName => 'task_form_fields_view';

  @override
  TaskFormFieldsViewRow createRow(Map<String, dynamic> data) =>
      TaskFormFieldsViewRow(data);
}

class TaskFormFieldsViewRow extends SupabaseDataRow {
  TaskFormFieldsViewRow(super.data);

  @override
  SupabaseTable get table => TaskFormFieldsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  int? get type => getField<int>('type');
  set type(int? value) => setField<int>('type', value);

  String? get label => getField<String>('label');
  set label(String? value) => setField<String>('label', value);

  int? get min => getField<int>('min');
  set min(int? value) => setField<int>('min', value);

  int? get max => getField<int>('max');
  set max(int? value) => setField<int>('max', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get hint => getField<String>('hint');
  set hint(String? value) => setField<String>('hint', value);

  String? get pageId => getField<String>('page_id');
  set pageId(String? value) => setField<String>('page_id', value);

  String? get formId => getField<String>('form_id');
  set formId(String? value) => setField<String>('form_id', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);
}
