import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController2;
  Query? listViewPagingQuery2;
  List<StreamSubscription?> listViewStreamSubscriptions2 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController3;
  Query? listViewPagingQuery3;
  List<StreamSubscription?> listViewStreamSubscriptions3 = [];

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController4;
  Query? listViewPagingQuery4;
  List<StreamSubscription?> listViewStreamSubscriptions4 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController5;
  Query? listViewPagingQuery5;
  List<StreamSubscription?> listViewStreamSubscriptions5 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController6;
  Query? listViewPagingQuery6;
  List<StreamSubscription?> listViewStreamSubscriptions6 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController7;
  Query? listViewPagingQuery7;
  List<StreamSubscription?> listViewStreamSubscriptions7 = [];

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProdutosRecord>?
      listViewPagingController8;
  Query? listViewPagingQuery8;
  List<StreamSubscription?> listViewStreamSubscriptions8 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textController?.dispose();
    listViewStreamSubscriptions2.forEach((s) => s?.cancel());
    listViewPagingController2?.dispose();

    listViewStreamSubscriptions3.forEach((s) => s?.cancel());
    listViewPagingController3?.dispose();

    tabBarController?.dispose();
    listViewStreamSubscriptions4.forEach((s) => s?.cancel());
    listViewPagingController4?.dispose();

    listViewStreamSubscriptions5.forEach((s) => s?.cancel());
    listViewPagingController5?.dispose();

    listViewStreamSubscriptions6.forEach((s) => s?.cancel());
    listViewPagingController6?.dispose();

    listViewStreamSubscriptions7.forEach((s) => s?.cancel());
    listViewPagingController7?.dispose();

    listViewStreamSubscriptions8.forEach((s) => s?.cancel());
    listViewPagingController8?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController2(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController2 ??= _createListViewController2(query, parent);
    if (listViewPagingQuery2 != query) {
      listViewPagingQuery2 = query;
      listViewPagingController2?.refresh();
    }
    return listViewPagingController2!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController2(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions2,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController3(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController3 ??= _createListViewController3(query, parent);
    if (listViewPagingQuery3 != query) {
      listViewPagingQuery3 = query;
      listViewPagingController3?.refresh();
    }
    return listViewPagingController3!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController3(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions3,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController4(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController4 ??= _createListViewController4(query, parent);
    if (listViewPagingQuery4 != query) {
      listViewPagingQuery4 = query;
      listViewPagingController4?.refresh();
    }
    return listViewPagingController4!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController4(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions4,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController5(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController5 ??= _createListViewController5(query, parent);
    if (listViewPagingQuery5 != query) {
      listViewPagingQuery5 = query;
      listViewPagingController5?.refresh();
    }
    return listViewPagingController5!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController5(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions5,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController6(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController6 ??= _createListViewController6(query, parent);
    if (listViewPagingQuery6 != query) {
      listViewPagingQuery6 = query;
      listViewPagingController6?.refresh();
    }
    return listViewPagingController6!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController6(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions6,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController7(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController7 ??= _createListViewController7(query, parent);
    if (listViewPagingQuery7 != query) {
      listViewPagingQuery7 = query;
      listViewPagingController7?.refresh();
    }
    return listViewPagingController7!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController7(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions7,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, ProdutosRecord> setListViewController8(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController8 ??= _createListViewController8(query, parent);
    if (listViewPagingQuery8 != query) {
      listViewPagingQuery8 = query;
      listViewPagingController8?.refresh();
    }
    return listViewPagingController8!;
  }

  PagingController<DocumentSnapshot?, ProdutosRecord>
      _createListViewController8(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProdutosRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProdutosRecordPage(
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions8,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
