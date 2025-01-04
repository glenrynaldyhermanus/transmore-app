// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ResultValuesStruct extends FFFirebaseStruct {
  ResultValuesStruct({
    String? resultValueId,
    String? resultId,
    String? fieldId,
    String? label,
    String? value,
    int? type,
    bool? isQcField,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _resultValueId = resultValueId,
        _resultId = resultId,
        _fieldId = fieldId,
        _label = label,
        _value = value,
        _type = type,
        _isQcField = isQcField,
        super(firestoreUtilData);

  // "result_value_id" field.
  String? _resultValueId;
  String get resultValueId => _resultValueId ?? '';
  set resultValueId(String? val) => _resultValueId = val;

  bool hasResultValueId() => _resultValueId != null;

  // "result_id" field.
  String? _resultId;
  String get resultId => _resultId ?? '';
  set resultId(String? val) => _resultId = val;

  bool hasResultId() => _resultId != null;

  // "field_id" field.
  String? _fieldId;
  String get fieldId => _fieldId ?? '';
  set fieldId(String? val) => _fieldId = val;

  bool hasFieldId() => _fieldId != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  set label(String? val) => _label = val;

  bool hasLabel() => _label != null;

  // "value" field.
  String? _value;
  String get value => _value ?? '';
  set value(String? val) => _value = val;

  bool hasValue() => _value != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;

  void incrementType(int amount) => type = type + amount;

  bool hasType() => _type != null;

  // "is_qc_field" field.
  bool? _isQcField;
  bool get isQcField => _isQcField ?? false;
  set isQcField(bool? val) => _isQcField = val;

  bool hasIsQcField() => _isQcField != null;

  static ResultValuesStruct fromMap(Map<String, dynamic> data) =>
      ResultValuesStruct(
        resultValueId: data['result_value_id'] as String?,
        resultId: data['result_id'] as String?,
        fieldId: data['field_id'] as String?,
        label: data['label'] as String?,
        value: data['value'] as String?,
        type: castToType<int>(data['type']),
        isQcField: data['is_qc_field'] as bool?,
      );

  static ResultValuesStruct? maybeFromMap(dynamic data) => data is Map
      ? ResultValuesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'result_value_id': _resultValueId,
        'result_id': _resultId,
        'field_id': _fieldId,
        'label': _label,
        'value': _value,
        'type': _type,
        'is_qc_field': _isQcField,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'result_value_id': serializeParam(
          _resultValueId,
          ParamType.String,
        ),
        'result_id': serializeParam(
          _resultId,
          ParamType.String,
        ),
        'field_id': serializeParam(
          _fieldId,
          ParamType.String,
        ),
        'label': serializeParam(
          _label,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'is_qc_field': serializeParam(
          _isQcField,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ResultValuesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultValuesStruct(
        resultValueId: deserializeParam(
          data['result_value_id'],
          ParamType.String,
          false,
        ),
        resultId: deserializeParam(
          data['result_id'],
          ParamType.String,
          false,
        ),
        fieldId: deserializeParam(
          data['field_id'],
          ParamType.String,
          false,
        ),
        label: deserializeParam(
          data['label'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        isQcField: deserializeParam(
          data['is_qc_field'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ResultValuesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResultValuesStruct &&
        resultValueId == other.resultValueId &&
        resultId == other.resultId &&
        fieldId == other.fieldId &&
        label == other.label &&
        value == other.value &&
        type == other.type &&
        isQcField == other.isQcField;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([resultValueId, resultId, fieldId, label, value, type, isQcField]);
}

ResultValuesStruct createResultValuesStruct({
  String? resultValueId,
  String? resultId,
  String? fieldId,
  String? label,
  String? value,
  int? type,
  bool? isQcField,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResultValuesStruct(
      resultValueId: resultValueId,
      resultId: resultId,
      fieldId: fieldId,
      label: label,
      value: value,
      type: type,
      isQcField: isQcField,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResultValuesStruct? updateResultValuesStruct(
  ResultValuesStruct? resultValues, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    resultValues
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResultValuesStructData(
  Map<String, dynamic> firestoreData,
  ResultValuesStruct? resultValues,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (resultValues == null) {
    return;
  }
  if (resultValues.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && resultValues.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final resultValuesData =
      getResultValuesFirestoreData(resultValues, forFieldValue);
  final nestedData =
      resultValuesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = resultValues.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResultValuesFirestoreData(
  ResultValuesStruct? resultValues, [
  bool forFieldValue = false,
]) {
  if (resultValues == null) {
    return {};
  }
  final firestoreData = mapToFirestore(resultValues.toMap());

  // Add any Firestore field values
  resultValues.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResultValuesListFirestoreData(
  List<ResultValuesStruct>? resultValuess,
) =>
    resultValuess?.map((e) => getResultValuesFirestoreData(e, true)).toList() ??
    [];
