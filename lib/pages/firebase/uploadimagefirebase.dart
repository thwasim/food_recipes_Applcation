import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Firebaseapi {
  static UploadTask? uploadfile(String destination, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      log(file.path);
      return ref.putFile(file);
    } on FirebaseException catch (_) {
      return null;
    }
  }
}
