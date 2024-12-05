import '../database.dart';

class ClientsViewTable extends SupabaseTable<ClientsViewRow> {
  @override
  String get tableName => 'clients_view';

  @override
  ClientsViewRow createRow(Map<String, dynamic> data) => ClientsViewRow(data);
}

class ClientsViewRow extends SupabaseDataRow {
  ClientsViewRow(super.data);

  @override
  SupabaseTable get table => ClientsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get pictureUrl => getField<String>('picture_url');
  set pictureUrl(String? value) => setField<String>('picture_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get active => getField<bool>('active');
  set active(bool? value) => setField<bool>('active', value);

  String? get legalName => getField<String>('legal_name');
  set legalName(String? value) => setField<String>('legal_name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get personInCharge => getField<String>('person_in_charge');
  set personInCharge(String? value) =>
      setField<String>('person_in_charge', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);
}
