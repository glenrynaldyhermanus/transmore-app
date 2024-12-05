import '../database.dart';

class ItemsViewTable extends SupabaseTable<ItemsViewRow> {
  @override
  String get tableName => 'items_view';

  @override
  ItemsViewRow createRow(Map<String, dynamic> data) => ItemsViewRow(data);
}

class ItemsViewRow extends SupabaseDataRow {
  ItemsViewRow(super.data);

  @override
  SupabaseTable get table => ItemsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get weight => getField<double>('weight');
  set weight(double? value) => setField<double>('weight', value);

  String? get dimensions => getField<String>('dimensions');
  set dimensions(String? value) => setField<String>('dimensions', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get client => getField<String>('client');
  set client(String? value) => setField<String>('client', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  int? get fieldsCount => getField<int>('fields_count');
  set fieldsCount(int? value) => setField<int>('fields_count', value);

  bool? get hasField => getField<bool>('has_field');
  set hasField(bool? value) => setField<bool>('has_field', value);
}
