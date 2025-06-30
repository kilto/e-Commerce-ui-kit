import '/flutter_flow/flutter_flow_util.dart';
import 'shipping_list_page_widget.dart' show ShippingListPageWidget;
import 'package:flutter/material.dart';

class ShippingListPageModel extends FlutterFlowModel<ShippingListPageWidget> {
  ///  Local state fields for this page.

  int? selectedItem = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
