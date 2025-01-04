// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AuthUserStruct extends FFFirebaseStruct {
  AuthUserStruct({
    String? id,
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? gender,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _uid = uid,
        _name = name,
        _email = email,
        _phone = phone,
        _gender = gender,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  set gender(String? val) => _gender = val;

  bool hasGender() => _gender != null;

  static AuthUserStruct fromMap(Map<String, dynamic> data) => AuthUserStruct(
        id: data['id'] as String?,
        uid: data['uid'] as String?,
        name: data['name'] as String?,
        email: data['email'] as String?,
        phone: data['phone'] as String?,
        gender: data['gender'] as String?,
      );

  static AuthUserStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuthUserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'uid': _uid,
        'name': _name,
        'email': _email,
        'phone': _phone,
        'gender': _gender,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.String,
        ),
      }.withoutNulls;

  static AuthUserStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthUserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AuthUserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthUserStruct &&
        id == other.id &&
        uid == other.uid &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        gender == other.gender;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, uid, name, email, phone, gender]);
}

AuthUserStruct createAuthUserStruct({
  String? id,
  String? uid,
  String? name,
  String? email,
  String? phone,
  String? gender,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuthUserStruct(
      id: id,
      uid: uid,
      name: name,
      email: email,
      phone: phone,
      gender: gender,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuthUserStruct? updateAuthUserStruct(
  AuthUserStruct? authUser, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    authUser
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuthUserStructData(
  Map<String, dynamic> firestoreData,
  AuthUserStruct? authUser,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (authUser == null) {
    return;
  }
  if (authUser.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && authUser.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final authUserData = getAuthUserFirestoreData(authUser, forFieldValue);
  final nestedData = authUserData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = authUser.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuthUserFirestoreData(
  AuthUserStruct? authUser, [
  bool forFieldValue = false,
]) {
  if (authUser == null) {
    return {};
  }
  final firestoreData = mapToFirestore(authUser.toMap());

  // Add any Firestore field values
  authUser.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuthUserListFirestoreData(
  List<AuthUserStruct>? authUsers,
) =>
    authUsers?.map((e) => getAuthUserFirestoreData(e, true)).toList() ?? [];
