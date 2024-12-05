import '../database.dart';

class PlacesStoreViewTable extends SupabaseTable<PlacesStoreViewRow> {
  @override
  String get tableName => 'places_store_view';

  @override
  PlacesStoreViewRow createRow(Map<String, dynamic> data) =>
      PlacesStoreViewRow(data);
}

class PlacesStoreViewRow extends SupabaseDataRow {
  PlacesStoreViewRow(super.data);

  @override
  SupabaseTable get table => PlacesStoreViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get client => getField<String>('client');
  set client(String? value) => setField<String>('client', value);

  String? get clientId => getField<String>('client_id');
  set clientId(String? value) => setField<String>('client_id', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);
}
