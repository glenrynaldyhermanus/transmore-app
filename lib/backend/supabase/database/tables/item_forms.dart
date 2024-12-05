import '../database.dart';

class ItemFormsTable extends SupabaseTable<ItemFormsRow> {
  @override
  String get tableName => 'item_forms';

  @override
  ItemFormsRow createRow(Map<String, dynamic> data) => ItemFormsRow(data);
}

class ItemFormsRow extends SupabaseDataRow {
  ItemFormsRow(super.data);

  @override
  SupabaseTable get table => ItemFormsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get itemId => getField<String>('item_id')!;
  set itemId(String value) => setField<String>('item_id', value);

  String get formId => getField<String>('form_id')!;
  set formId(String value) => setField<String>('form_id', value);
}
