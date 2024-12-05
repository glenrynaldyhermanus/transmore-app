import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

bool checkResultValues(
  ResultsRecord result,
  String fieldId,
) {
  // check if result_value exists inside result document, and also check if the result_value contains the field_id from fieldId is exists, return true if all does conditions exists
  if (result.resultValues != null) {
    for (var resultValue in result.resultValues!) {
      if (resultValue.fieldId == fieldId) {
        return true;
      }
    }
  }
  return false;
}

String getInitialValue(
  ResultsRecord result,
  String fieldId,
) {
  // get value of result_values from results where field_id = fieldId
  if (result.resultValues != null) {
    for (var resultValue in result.resultValues!) {
      if (resultValue.fieldId == fieldId) {
        return resultValue.value;
      }
    }
  }
  return "";
}

String imagePathFromUrl(String url) {
  // Return empty string if the URL is empty
  if (url.isEmpty) {
    return '';
  }

  // Check if the URL is a data URL
  if (url.startsWith('data:image')) {
    return 'memory';
  }

  // Check if the URL is a network URL
  if (url.startsWith('http')) {
    return url; // Return the URL as is
  }

  // Return empty string for unrecognized URLs
  return '';
}
