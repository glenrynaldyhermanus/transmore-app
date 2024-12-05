import '../database.dart';

class TaskFormsTable extends SupabaseTable<TaskFormsRow> {
  @override
  String get tableName => 'task_forms';

  @override
  TaskFormsRow createRow(Map<String, dynamic> data) => TaskFormsRow(data);
}

class TaskFormsRow extends SupabaseDataRow {
  TaskFormsRow(super.data);

  @override
  SupabaseTable get table => TaskFormsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get taskId => getField<String>('task_id')!;
  set taskId(String value) => setField<String>('task_id', value);

  String get formId => getField<String>('form_id')!;
  set formId(String value) => setField<String>('form_id', value);
}
