import '../database.dart';

class TasksViewTable extends SupabaseTable<TasksViewRow> {
  @override
  String get tableName => 'tasks_view';

  @override
  TasksViewRow createRow(Map<String, dynamic> data) => TasksViewRow(data);
}

class TasksViewRow extends SupabaseDataRow {
  TasksViewRow(super.data);

  @override
  SupabaseTable get table => TasksViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get placeId => getField<String>('place_id');
  set placeId(String? value) => setField<String>('place_id', value);

  String? get place => getField<String>('place');
  set place(String? value) => setField<String>('place', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get projectId => getField<String>('project_id');
  set projectId(String? value) => setField<String>('project_id', value);

  String? get projectName => getField<String>('project_name');
  set projectName(String? value) => setField<String>('project_name', value);

  String? get workerId => getField<String>('worker_id');
  set workerId(String? value) => setField<String>('worker_id', value);

  String? get workerName => getField<String>('worker_name');
  set workerName(String? value) => setField<String>('worker_name', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  int? get statusKey => getField<int>('status_key');
  set statusKey(int? value) => setField<int>('status_key', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get itemsCount => getField<int>('items_count');
  set itemsCount(int? value) => setField<int>('items_count', value);

  String? get items => getField<String>('items');
  set items(String? value) => setField<String>('items', value);
}
