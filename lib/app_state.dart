import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_authUser')) {
        try {
          final serializedData = prefs.getString('ff_authUser') ?? '{}';
          _authUser =
              AuthUserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  AuthUserStruct _authUser = AuthUserStruct();
  AuthUserStruct get authUser => _authUser;
  set authUser(AuthUserStruct value) {
    _authUser = value;
    prefs.setString('ff_authUser', value.serialize());
  }

  void updateAuthUserStruct(Function(AuthUserStruct) updateFn) {
    updateFn(_authUser);
    prefs.setString('ff_authUser', _authUser.serialize());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
