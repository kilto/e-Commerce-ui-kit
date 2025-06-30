import '/flutter_flow/flutter_flow_util.dart';
import 'activation_email_page_widget.dart' show ActivationEmailPageWidget;
import 'package:flutter/material.dart';

class ActivationEmailPageModel
    extends FlutterFlowModel<ActivationEmailPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
