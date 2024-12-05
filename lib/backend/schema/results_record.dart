import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultsRecord extends FirestoreRecord {
  ResultsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "result_id" field.
  String? _resultId;
  String get resultId => _resultId ?? '';
  bool hasResultId() => _resultId != null;

  // "project_id" field.
  String? _projectId;
  String get projectId => _projectId ?? '';
  bool hasProjectId() => _projectId != null;

  // "project" field.
  String? _project;
  String get project => _project ?? '';
  bool hasProject() => _project != null;

  // "worker_id" field.
  String? _workerId;
  String get workerId => _workerId ?? '';
  bool hasWorkerId() => _workerId != null;

  // "worker" field.
  String? _worker;
  String get worker => _worker ?? '';
  bool hasWorker() => _worker != null;

  // "task_id" field.
  String? _taskId;
  String get taskId => _taskId ?? '';
  bool hasTaskId() => _taskId != null;

  // "task" field.
  String? _task;
  String get task => _task ?? '';
  bool hasTask() => _task != null;

  // "place_id" field.
  String? _placeId;
  String get placeId => _placeId ?? '';
  bool hasPlaceId() => _placeId != null;

  // "place" field.
  String? _place;
  String get place => _place ?? '';
  bool hasPlace() => _place != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "status_key" field.
  int? _statusKey;
  int get statusKey => _statusKey ?? 0;
  bool hasStatusKey() => _statusKey != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "result_values" field.
  List<ResultValuesStruct>? _resultValues;
  List<ResultValuesStruct> get resultValues => _resultValues ?? const [];
  bool hasResultValues() => _resultValues != null;

  void _initializeFields() {
    _resultId = snapshotData['result_id'] as String?;
    _projectId = snapshotData['project_id'] as String?;
    _project = snapshotData['project'] as String?;
    _workerId = snapshotData['worker_id'] as String?;
    _worker = snapshotData['worker'] as String?;
    _taskId = snapshotData['task_id'] as String?;
    _task = snapshotData['task'] as String?;
    _placeId = snapshotData['place_id'] as String?;
    _place = snapshotData['place'] as String?;
    _status = snapshotData['status'] as String?;
    _statusKey = castToType<int>(snapshotData['status_key']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _resultValues = getStructList(
      snapshotData['result_values'],
      ResultValuesStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('results');

  static Stream<ResultsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResultsRecord.fromSnapshot(s));

  static Future<ResultsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResultsRecord.fromSnapshot(s));

  static ResultsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResultsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResultsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResultsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResultsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResultsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResultsRecordData({
  String? resultId,
  String? projectId,
  String? project,
  String? workerId,
  String? worker,
  String? taskId,
  String? task,
  String? placeId,
  String? place,
  String? status,
  int? statusKey,
  DateTime? createdAt,
  DateTime? updatedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'result_id': resultId,
      'project_id': projectId,
      'project': project,
      'worker_id': workerId,
      'worker': worker,
      'task_id': taskId,
      'task': task,
      'place_id': placeId,
      'place': place,
      'status': status,
      'status_key': statusKey,
      'created_at': createdAt,
      'updated_at': updatedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResultsRecordDocumentEquality implements Equality<ResultsRecord> {
  const ResultsRecordDocumentEquality();

  @override
  bool equals(ResultsRecord? e1, ResultsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.resultId == e2?.resultId &&
        e1?.projectId == e2?.projectId &&
        e1?.project == e2?.project &&
        e1?.workerId == e2?.workerId &&
        e1?.worker == e2?.worker &&
        e1?.taskId == e2?.taskId &&
        e1?.task == e2?.task &&
        e1?.placeId == e2?.placeId &&
        e1?.place == e2?.place &&
        e1?.status == e2?.status &&
        e1?.statusKey == e2?.statusKey &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.resultValues, e2?.resultValues);
  }

  @override
  int hash(ResultsRecord? e) => const ListEquality().hash([
        e?.resultId,
        e?.projectId,
        e?.project,
        e?.workerId,
        e?.worker,
        e?.taskId,
        e?.task,
        e?.placeId,
        e?.place,
        e?.status,
        e?.statusKey,
        e?.createdAt,
        e?.updatedAt,
        e?.resultValues
      ]);

  @override
  bool isValidKey(Object? o) => o is ResultsRecord;
}
