import '../database.dart';

class OptionsGroupedViewTable extends SupabaseTable<OptionsGroupedViewRow> {
  @override
  String get tableName => 'options_grouped_view';

  @override
  OptionsGroupedViewRow createRow(Map<String, dynamic> data) =>
      OptionsGroupedViewRow(data);
}

class OptionsGroupedViewRow extends SupabaseDataRow {
  OptionsGroupedViewRow(super.data);

  @override
  SupabaseTable get table => OptionsGroupedViewTable();

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get count => getField<int>('count');
  set count(int? value) => setField<int>('count', value);
}
