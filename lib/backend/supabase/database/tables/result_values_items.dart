import '../database.dart';

class ResultValuesItemsTable extends SupabaseTable<ResultValuesItemsRow> {
  @override
  String get tableName => 'result_values_items';

  @override
  ResultValuesItemsRow createRow(Map<String, dynamic> data) =>
      ResultValuesItemsRow(data);
}

class ResultValuesItemsRow extends SupabaseDataRow {
  ResultValuesItemsRow(super.data);

  @override
  SupabaseTable get table => ResultValuesItemsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get fieldId => getField<String>('field_id')!;
  set fieldId(String value) => setField<String>('field_id', value);

  String? get value => getField<String>('value');
  set value(String? value) => setField<String>('value', value);

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

  int get status => getField<int>('status')!;
  set status(int value) => setField<int>('status', value);

  String get label => getField<String>('label')!;
  set label(String value) => setField<String>('label', value);

  String get resultId => getField<String>('result_id')!;
  set resultId(String value) => setField<String>('result_id', value);

  String get itemId => getField<String>('item_id')!;
  set itemId(String value) => setField<String>('item_id', value);
}
