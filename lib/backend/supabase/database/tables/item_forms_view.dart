import '../database.dart';

class ItemFormsViewTable extends SupabaseTable<ItemFormsViewRow> {
  @override
  String get tableName => 'item_forms_view';

  @override
  ItemFormsViewRow createRow(Map<String, dynamic> data) =>
      ItemFormsViewRow(data);
}

class ItemFormsViewRow extends SupabaseDataRow {
  ItemFormsViewRow(super.data);

  @override
  SupabaseTable get table => ItemFormsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get updatedBy => getField<String>('updated_by');
  set updatedBy(String? value) => setField<String>('updated_by', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get itemId => getField<String>('item_id');
  set itemId(String? value) => setField<String>('item_id', value);

  String? get itemName => getField<String>('item_name');
  set itemName(String? value) => setField<String>('item_name', value);
}
