import '/component/item_list_cart/item_list_cart_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ItemListCart component.
  late ItemListCartModel itemListCartModel1;
  // Model for ItemListCart component.
  late ItemListCartModel itemListCartModel2;
  // Model for ItemListCart component.
  late ItemListCartModel itemListCartModel3;

  @override
  void initState(BuildContext context) {
    itemListCartModel1 = createModel(context, () => ItemListCartModel());
    itemListCartModel2 = createModel(context, () => ItemListCartModel());
    itemListCartModel3 = createModel(context, () => ItemListCartModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    itemListCartModel1.dispose();
    itemListCartModel2.dispose();
    itemListCartModel3.dispose();
  }
}
