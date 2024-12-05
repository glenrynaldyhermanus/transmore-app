// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ResultsRecord> updateResultValue(
  ResultsRecord results,
  String fieldId,
  String value,
) async {
  // find result_values data type inside results document, and filter where result_id= result.id and field_id is fieldId and update the value from value and return the result as updatedResult

  // Find the result_values data type inside results document
  List<ResultValuesStruct> resultValues = results.resultValues;

  // Filter where result_id = result.id and field_id is fieldId
  ResultValuesStruct resultValueToUpdate = resultValues.firstWhere(
    (resultValue) =>
        resultValue.resultId == results.resultId &&
        resultValue.fieldId == fieldId,
  );

  // Update the value from value
  resultValueToUpdate.value = value;

  // Return the updated result
  return results;
}
