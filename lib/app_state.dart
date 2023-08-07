import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Aleterarnome = prefs.getBool('ff_Aleterarnome') ?? _Aleterarnome;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _Aleterarnome = false;
  bool get Aleterarnome => _Aleterarnome;
  set Aleterarnome(bool _value) {
    _Aleterarnome = _value;
    prefs.setBool('ff_Aleterarnome', _value);
  }

  List<DocumentReference> _favoritos = [];
  List<DocumentReference> get favoritos => _favoritos;
  set favoritos(List<DocumentReference> _value) {
    _favoritos = _value;
  }

  void addToFavoritos(DocumentReference _value) {
    _favoritos.add(_value);
  }

  void removeFromFavoritos(DocumentReference _value) {
    _favoritos.remove(_value);
  }

  void removeAtIndexFromFavoritos(int _index) {
    _favoritos.removeAt(_index);
  }

  void updateFavoritosAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favoritos[_index] = updateFn(_favoritos[_index]);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
