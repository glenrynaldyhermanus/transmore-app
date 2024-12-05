import '../database.dart';

class WorkerUsersViewTable extends SupabaseTable<WorkerUsersViewRow> {
  @override
  String get tableName => 'worker_users_view';

  @override
  WorkerUsersViewRow createRow(Map<String, dynamic> data) =>
      WorkerUsersViewRow(data);
}

class WorkerUsersViewRow extends SupabaseDataRow {
  WorkerUsersViewRow(super.data);

  @override
  SupabaseTable get table => WorkerUsersViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  int? get roleKey => getField<int>('role_key');
  set roleKey(int? value) => setField<int>('role_key', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get client => getField<String>('client');
  set client(String? value) => setField<String>('client', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime? get joinAt => getField<DateTime>('join_at');
  set joinAt(DateTime? value) => setField<DateTime>('join_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get statusKey => getField<int>('status_key');
  set statusKey(int? value) => setField<int>('status_key', value);
}
