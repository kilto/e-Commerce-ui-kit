import '/flutter_flow/flutter_flow_util.dart';
import 'item_list_cart_widget.dart' show ItemListCartWidget;
import 'package:flutter/material.dart';

class ItemListCartModel extends FlutterFlowModel<ItemListCartWidget> {
  ///  Local state fields for this component.

  bool isFav = false;

  int qty = 1;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
