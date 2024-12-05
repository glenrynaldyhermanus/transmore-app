import '../database.dart';

class ClientUsersTable extends SupabaseTable<ClientUsersRow> {
  @override
  String get tableName => 'client_users';

  @override
  ClientUsersRow createRow(Map<String, dynamic> data) => ClientUsersRow(data);
}

class ClientUsersRow extends SupabaseDataRow {
  ClientUsersRow(super.data);

  @override
  SupabaseTable get table => ClientUsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get createdBy => getField<String>('created_by')!;
  set createdBy(String value) => setField<String>('created_by', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  bool get active => getField<bool>('active')!;
  set active(bool value) => setField<bool>('active', value);

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  int get role => getField<int>('role')!;
  set role(int value) => setField<int>('role', value);
}
