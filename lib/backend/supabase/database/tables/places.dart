import '../database.dart';

class PlacesTable extends SupabaseTable<PlacesRow> {
  @override
  String get tableName => 'places';

  @override
  PlacesRow createRow(Map<String, dynamic> data) => PlacesRow(data);
}

class PlacesRow extends SupabaseDataRow {
  PlacesRow(super.data);

  @override
  SupabaseTable get table => PlacesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get clientId => getField<String>('client_id')!;
  set clientId(String value) => setField<String>('client_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get address => getField<String>('address')!;
  set address(String value) => setField<String>('address', value);

  String get phone => getField<String>('phone')!;
  set phone(String value) => setField<String>('phone', value);

  int get type => getField<int>('type')!;
  set type(int value) => setField<int>('type', value);

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

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);
}
