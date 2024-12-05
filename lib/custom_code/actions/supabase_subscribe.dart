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

import 'package:supabase_flutter/supabase_flutter.dart';

Future supabaseSubscribe(
  String table,
  Future Function() callbackAction,
) async {
  // Add your function code here!
  SupaFlow.client
      .channel('public:$table')
      // Setting up an event listener on the channel.
      // It listens for any Postgres changes (inserts, updates, deletes, etc.),
      // specifically on the 'public' schema of the given table.
      .onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: table,
        callback: (PostgresChangePayload payload) async {
          // Defining the action to take when an update is detected.
          // The function 'callbackAction' is called in response to these changes.
          await callbackAction();
        },
      )
      // Finalizing the subscription to start listening for the events.
      .subscribe();
}
