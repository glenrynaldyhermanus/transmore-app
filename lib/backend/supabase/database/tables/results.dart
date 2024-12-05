import '../database.dart';

class ResultsTable extends SupabaseTable<ResultsRow> {
  @override
  String get tableName => 'results';

  @override
  ResultsRow createRow(Map<String, dynamic> data) => ResultsRow(data);
}

class ResultsRow extends SupabaseDataRow {
  ResultsRow(super.data);

  @override
  SupabaseTable get table => ResultsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get taskId => getField<String>('task_id')!;
  set taskId(String value) => setField<String>('task_id', value);

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

  String get workerId => getField<String>('worker_id')!;
  set workerId(String value) => setField<String>('worker_id', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);
}
