import '../backend/backend.dart';
import '../components/termin_item_widget.dart';
import '../components/ff/theme.dart';
import '../components/ff/util.dart';
import 'package:flutter/material.dart';

class TerminPageWidget extends StatefulWidget {
  const TerminPageWidget({Key? key}) : super(key: key);

  @override
  _TerminPageWidgetState createState() => _TerminPageWidgetState();
}

class _TerminPageWidgetState extends State<TerminPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Termine',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                StreamBuilder<List<TermineRecord>>(
                  stream: queryTermineRecord(
                    queryBuilder: (termineRecord) =>
                        termineRecord.orderBy('date').orderBy('isDone'),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<TermineRecord> listViewTermineRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTermineRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTermineRecord =
                            listViewTermineRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'TerminDetailPage',
                                queryParams: {
                                  'termin': serializeParam(
                                    listViewTermineRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'termin': listViewTermineRecord,
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            child: TerminItemWidget(
                              key: Key('TerminItem_$listViewIndex'),
                              termin: listViewTermineRecord,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
