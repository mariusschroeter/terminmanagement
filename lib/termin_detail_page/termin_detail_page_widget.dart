import '../backend/backend.dart';
import '../components/termin_button_widget.dart';
import '../components/ff/icon_button.dart';
import '../components/ff/theme.dart';
import '../components/ff/util.dart';
import 'package:flutter/material.dart';

class TerminDetailPageWidget extends StatefulWidget {
  const TerminDetailPageWidget({
    Key? key,
    this.termin,
  }) : super(key: key);

  final TermineRecord? termin;

  @override
  _TerminDetailPageWidgetState createState() => _TerminDetailPageWidgetState();
}

class _TerminDetailPageWidgetState extends State<TerminDetailPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final duration = getdurationStr(widget.termin!.duration!);
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Termin Details',
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
            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        dateTimeFormat('d/M H:mm', widget.termin!.date!),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        duration,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        widget.termin!.company!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        widget.termin!.address!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Text(
                        widget.termin!.contact!,
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                    ],
                  ),
                ),
                TerminButtonWidget(
                    text: 'Termin abschließen',
                    color: FlutterFlowTheme.of(context).primaryColor,
                    onPressed: () => {
                          context.pushNamed(
                            'TerminDoneOrCancelPage',
                            queryParams: {
                              'status': serializeParam(
                                'done',
                                ParamType.String,
                              ),
                              'termin': serializeParam(
                                widget.termin,
                                ParamType.Document,
                              )
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          ),
                        }),
                TerminButtonWidget(
                    text: 'Termin absagen',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    onPressed: () => {
                          context.pushNamed(
                            'TerminDoneOrCancelPage',
                            queryParams: {
                              'status': serializeParam(
                                'canceled',
                                ParamType.String,
                              ),
                              'termin': serializeParam(
                                widget.termin,
                                ParamType.Document,
                              )
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.rightToLeft,
                                duration: Duration(milliseconds: 300),
                              ),
                            },
                          ),
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
