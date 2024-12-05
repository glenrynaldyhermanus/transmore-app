import '../database.dart';

class ProjectsTable extends SupabaseTable<ProjectsRow> {
  @override
  String get tableName => 'projects';

  @override
  ProjectsRow createRow(Map<String, dynamic> data) => ProjectsRow(data);
}

class ProjectsRow extends SupabaseDataRow {
  ProjectsRow(super.data);

  @override
  SupabaseTable get table => ProjectsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

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

  DateTime get startDate => getField<DateTime>('start_date')!;
  set startDate(DateTime value) => setField<DateTime>('start_date', value);

  DateTime get endDate => getField<DateTime>('end_date')!;
  set endDate(DateTime value) => setField<DateTime>('end_date', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);
}
