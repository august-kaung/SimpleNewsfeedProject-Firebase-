


import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:simple_newsfeed_project_two/constant/strings.dart';
import 'package:simple_newsfeed_project_two/network/data_agent/firebase_storage_store.dart';

class FirebaseStorageStoreImpl extends FirebaseStorageStore{
  final _firebaseStorage = FirebaseStorage.instance;
  @override
  Future<String> uploadFileToFireStorage(File image) => _firebaseStorage
      .ref(kFileUploadPath)
      .child('${DateTime.now().millisecondsSinceEpoch}')
      .putFile(image)
      .then((takeSnapShot) => takeSnapShot.ref.getDownloadURL());
  
}