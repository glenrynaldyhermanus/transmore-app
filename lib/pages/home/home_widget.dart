import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/sheets/continue_task_sheet/continue_task_sheet_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.supabaseUnsubscribe(
        'tasks',
      );
      await actions.supabaseSubscribe(
        'tasks',
        () async {
          safeSetState(() => _model.requestCompleter = null);
          await _model.waitForRequestCompleted();
        },
      );
      await Future.delayed(const Duration(milliseconds: 1000));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Deliveries',
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  fontFamily: 'Albert Sans',
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List<TasksViewRow>>(
            future: (_model.requestCompleter ??= Completer<List<TasksViewRow>>()
                  ..complete(TasksViewTable().queryRows(
                    queryFn: (q) => q
                        .eqOrNull(
                      'worker_id',
                      FFAppState().authUser.id,
                    )
                        .inFilterOrNull(
                      'status_key',
                      [2, 3],
                    ),
                  )))
                .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<TasksViewRow> listViewTasksViewRowList = snapshot.data!;

              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewTasksViewRowList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewTasksViewRow =
                      listViewTasksViewRowList[listViewIndex];
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      var shouldSetState = false;
                      _model.results = await queryResultsRecordOnce(
                        queryBuilder: (resultsRecord) => resultsRecord
                            .where(
                              'task_id',
                              isEqualTo: listViewTasksViewRow.id,
                            )
                            .where(
                              'worker_id',
                              isEqualTo: listViewTasksViewRow.workerId,
                            )
                            .where(
                              'status_key',
                              isEqualTo: 2,
                            ),
                      );
                      shouldSetState = true;
                      if (_model.results != null &&
                          (_model.results)!.isNotEmpty) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          useSafeArea: true,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: SizedBox(
                                  height: 414.0,
                                  child: ContinueTaskSheetWidget(
                                    task: listViewTasksViewRow,
                                    result: _model.results!.firstOrNull!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));

                        if (shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        _model.uuid = await actions.createRandomUuid();
                        shouldSetState = true;

                        var resultsRecordReference =
                            ResultsRecord.collection.doc();
                        await resultsRecordReference.set({
                          ...createResultsRecordData(
                            resultId: _model.uuid,
                            projectId: listViewTasksViewRow.projectId,
                            project: listViewTasksViewRow.projectName,
                            workerId: listViewTasksViewRow.workerId,
                            worker: listViewTasksViewRow.workerName,
                            taskId: listViewTasksViewRow.id,
                            task: listViewTasksViewRow.name,
                            placeId: listViewTasksViewRow.placeId,
                            place: listViewTasksViewRow.place,
                            status: 'On Progress',
                            statusKey: 2,
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': FieldValue.serverTimestamp(),
                              'updated_at': FieldValue.serverTimestamp(),
                            },
                          ),
                        });
                        _model.result = ResultsRecord.getDocumentFromData({
                          ...createResultsRecordData(
                            resultId: _model.uuid,
                            projectId: listViewTasksViewRow.projectId,
                            project: listViewTasksViewRow.projectName,
                            workerId: listViewTasksViewRow.workerId,
                            worker: listViewTasksViewRow.workerName,
                            taskId: listViewTasksViewRow.id,
                            task: listViewTasksViewRow.name,
                            placeId: listViewTasksViewRow.placeId,
                            place: listViewTasksViewRow.place,
                            status: 'On Progress',
                            statusKey: 2,
                          ),
                          ...mapToFirestore(
                            {
                              'created_at': DateTime.now(),
                              'updated_at': DateTime.now(),
                            },
                          ),
                        }, resultsRecordReference);
                        shouldSetState = true;

                        context.pushNamed(
                          'Form',
                          queryParameters: {
                            'taskName': serializeParam(
                              listViewTasksViewRow.name,
                              ParamType.String,
                            ),
                            'task': serializeParam(
                              listViewTasksViewRow,
                              ParamType.SupabaseRow,
                            ),
                            'resultRef': serializeParam(
                              _model.result?.reference,
                              ParamType.DocumentReference,
                            ),
                          }.withoutNulls,
                        );

                        if (shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (shouldSetState) safeSetState(() {});
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: ListTile(
                        title: Text(
                          listViewTasksViewRow.name!,
                          style:
                              FlutterFlowTheme.of(context).titleMedium.override(
                                    fontFamily: 'Albert Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        subtitle: Text(
                          listViewTasksViewRow.address!,
                          style:
                              FlutterFlowTheme.of(context).labelSmall.override(
                                    fontFamily: 'Albert Sans',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        dense: false,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
