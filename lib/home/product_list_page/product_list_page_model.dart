import '/component/item_card/item_card_widget.dart';
import '/component/item_list/item_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'product_list_page_widget.dart' show ProductListPageWidget;
import 'package:flutter/material.dart';

class ProductListPageModel extends FlutterFlowModel<ProductListPageWidget> {
  ///  Local state fields for this page.

  bool isShowAsList = true;

  bool isFiltered = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for ItemList component.
  late ItemListModel itemListModel1;
  // Model for ItemList component.
  late ItemListModel itemListModel2;
  // Model for ItemList component.
  late ItemListModel itemListModel3;
  // Model for ItemList component.
  late ItemListModel itemListModel4;
  // Model for ItemList component.
  late ItemListModel itemListModel5;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel1;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel2;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel3;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel4;
  // Model for ItemCard component.
  late ItemCardModel itemCardModel5;

  @override
  void initState(BuildContext context) {
    itemListModel1 = createModel(context, () => ItemListModel());
    itemListModel2 = createModel(context, () => ItemListModel());
    itemListModel3 = createModel(context, () => ItemListModel());
    itemListModel4 = createModel(context, () => ItemListModel());
    itemListModel5 = createModel(context, () => ItemListModel());
    itemCardModel1 = createModel(context, () => ItemCardModel());
    itemCardModel2 = createModel(context, () => ItemCardModel());
    itemCardModel3 = createModel(context, () => ItemCardModel());
    itemCardModel4 = createModel(context, () => ItemCardModel());
    itemCardModel5 = createModel(context, () => ItemCardModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    itemListModel1.dispose();
    itemListModel2.dispose();
    itemListModel3.dispose();
    itemListModel4.dispose();
    itemListModel5.dispose();
    itemCardModel1.dispose();
    itemCardModel2.dispose();
    itemCardModel3.dispose();
    itemCardModel4.dispose();
    itemCardModel5.dispose();
  }
}
