import '../backend/backend.dart';
import 'ff/theme.dart';
import 'ff/util.dart';
import 'package:flutter/material.dart';

class TerminItemWidget extends StatefulWidget {
  const TerminItemWidget({
    Key? key,
    this.termin,
  }) : super(key: key);

  final TermineRecord? termin;

  @override
  _TerminItemWidgetState createState() => _TerminItemWidgetState();
}

class _TerminItemWidgetState extends State<TerminItemWidget> {
  String getdurationStr(int dur) {
    return ((dur / 60).floor() / 60).toStringAsFixed(1) + " Stunde/n";
  }

  @override
  Widget build(BuildContext context) {
    final duration = getdurationStr(widget.termin!.duration!);
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: widget.termin!.isDone!
            ? Color(0x7FF1F4F8)
            : FlutterFlowTheme.of(context).primaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional(1, -1),
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dateTimeFormat('d/M H:mm', widget.termin!.date!),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF101213),
                                    ),
                          ),
                          Text(
                            widget.termin!.company!,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF101213),
                                    ),
                          ),
                          Text(
                            duration,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF101213),
                                    ),
                          ),
                          Text(
                            widget.termin!.address!,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF101213),
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (widget.termin!.isDone == true)
                    Text(
                      widget.termin!.status!,
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
