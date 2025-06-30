import '/flutter_flow/flutter_flow_util.dart';
import 'add_payment_method_page_widget.dart' show AddPaymentMethodPageWidget;
import 'package:flutter/material.dart';

class AddPaymentMethodPageModel
    extends FlutterFlowModel<AddPaymentMethodPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
