import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProdutosRecord extends FirestoreRecord {
  ProdutosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "marca" field.
  String? _marca;
  String get marca => _marca ?? '';
  bool hasMarca() => _marca != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  bool hasImg() => _img != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "local" field.
  String? _local;
  String get local => _local ?? '';
  bool hasLocal() => _local != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  bool hasData() => _data != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  bool hasFeedback() => _feedback != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _marca = snapshotData['marca'] as String?;
    _img = snapshotData['img'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _local = snapshotData['local'] as String?;
    _data = snapshotData['data'] as String?;
    _feedback = snapshotData['feedback'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('produtos');

  static Stream<ProdutosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProdutosRecord.fromSnapshot(s));

  static Future<ProdutosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProdutosRecord.fromSnapshot(s));

  static ProdutosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProdutosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProdutosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProdutosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProdutosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProdutosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProdutosRecordData({
  String? nome,
  String? marca,
  String? img,
  String? descricao,
  String? local,
  String? data,
  String? feedback,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'marca': marca,
      'img': img,
      'descricao': descricao,
      'local': local,
      'data': data,
      'feedback': feedback,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProdutosRecordDocumentEquality implements Equality<ProdutosRecord> {
  const ProdutosRecordDocumentEquality();

  @override
  bool equals(ProdutosRecord? e1, ProdutosRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.marca == e2?.marca &&
        e1?.img == e2?.img &&
        e1?.descricao == e2?.descricao &&
        e1?.local == e2?.local &&
        e1?.data == e2?.data &&
        e1?.feedback == e2?.feedback;
  }

  @override
  int hash(ProdutosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.marca,
        e?.img,
        e?.descricao,
        e?.local,
        e?.data,
        e?.feedback
      ]);

  @override
  bool isValidKey(Object? o) => o is ProdutosRecord;
}
