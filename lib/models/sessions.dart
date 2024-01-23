// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:localstore/localstore.dart';

class Session {
  String? id;
  String? sessionType;
  String? sessionImage;
  DateTime? sessionTime;
  Map? sessionData;
  Session({
     this.id,
     this.sessionType,
     this.sessionImage,
     this.sessionData,
     this.sessionTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sessionType': sessionType,
      'sessionImage': sessionImage,
      'sessionData': sessionData,
      'sessionTime': sessionTime!.millisecondsSinceEpoch,
    };
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      id: map['id'],
      sessionType: map['sessionType'],
      sessionImage: map['sessionImage'],
      sessionData: map['sessionData'],
      sessionTime: DateTime.fromMillisecondsSinceEpoch(map['sessionTime']),
    );
  }
}

extension ExtSession on Session {
  Future save() async {
    final db = Localstore.instance;
    return db.collection('Session').doc(id).set(toMap()).then((value) {
      log("ASSET DATA SAVED");
    });
  }

  Future delete() async {
    final db = Localstore.instance;
    return db.collection('Session').doc(id).delete();
  }
}

class SessionType {
  static const String IMAGE_TO_IMAGE = "image_to_image";
  static const String IMAGE_TO_VIDEO = "image_to_video";
  static const String TEXT_TO_IMAGE = "text_to_image";
  static const String AI_ASSISTANT = "ai_assistant";
}
