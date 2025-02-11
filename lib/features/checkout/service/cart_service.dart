import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class CartService extends GetxService {
  final Box _box;

  CartService(this._box);

  String get sessionId {
    final String? existingId = _box.get('session_id');
    if (existingId != null) {
      return existingId;
    }

    // Generate new session ID if none exists
    final newId = const Uuid().v4();
    _box.put('session_id', newId);
    return newId;
  }

  Future<void> clearSession() async {
    await _box.clear();
  }
}
