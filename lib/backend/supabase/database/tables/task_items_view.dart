import '../database.dart';

class TaskItemsViewTable extends SupabaseTable<TaskItemsViewRow> {
  @override
  String get tableName => 'task_items_view';

  @override
  TaskItemsViewRow createRow(Map<String, dynamic> data) =>
      TaskItemsViewRow(data);
}

class TaskItemsViewRow extends SupabaseDataRow {
  TaskItemsViewRow(super.data);

  @override
  SupabaseTable get table => TaskItemsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get taskId => getField<String>('task_id');
  set taskId(String? value) => setField<String>('task_id', value);

  String? get taskName => getField<String>('task_name');
  set taskName(String? value) => setField<String>('task_name', value);

  String? get itemId => getField<String>('item_id');
  set itemId(String? value) => setField<String>('item_id', value);

  String? get itemName => getField<String>('item_name');
  set itemName(String? value) => setField<String>('item_name', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);
}
