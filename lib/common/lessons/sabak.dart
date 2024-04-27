import 'dart:developer';

import 'package:flutter/material.dart';

class Sabak extends StatefulWidget {
  const Sabak({Key? key}) : super(key: key);

  @override
  _SabakState createState() => _SabakState();
}

class _SabakState extends State<Sabak> {
  /// Strongly typed

  /// Sabaktine temasi:
  /// 1. List => Massiv, Array, List, [Collections, Iterables]
  /// 2. Class

  /// Tizme, okuuchulardin
  /// a. okuuchu ---> String
  /// b. okuuchu - baa ---> int
  /// c. tizme - jurnal
//// c.1. okuuchulardin tizmesi
//// c.2. baalardin tizmesi

  String okuuchu1 = 'Jon Doe';
  String okuuchu2 = 'Jane Doe';
  String okuuchu3 = 'John Wick';
  String okuuchu4 = 'Jane Wick';

  String okuuchular2 = 'JonDoeJaneDoeBeksultanPrezidentov';
  List<String> okuuchular = ['Jon Doe', 'Jane Doe'];

  List<int> baalar = [1, 4, 5, 3, 2];

  User user1 = User(name: 'Jonbek', phone: 5550000012, id: '02');

  SuroolordunServisi servis = SuroolordunServisi();

  /// CLass
  /// data type,

  @override
  void initState() {
    log('user1.name: ${user1.name}');
    log('user1.runtimeType: ${user1.runtimeType}');

    log('servis.kiyinkiSuroonuAlipKe:  ${servis.kiyinkiSuroonuAlipKel()}');

    // log('okuuchu1 = $okuuchu1');
    // log('okuuchular = $okuuchular');
    // log('okuuchular, 1-okuuchu = ${okuuchular[0]}');
    // log('baalar = $baalar');
    // log('baalar.first = ${baalar.first}');
    // log('baalar.length = ${baalar.length}');
    // log('baalar.last = ${baalar.last}');
    // log('baalar.akirki value = ${baalar[baalar.length - 1]}');

    // baalar.add(5);
    // baalar.insert(0, 100);
    // log('===========================');
    // log('baalar.length = ${baalar.length}');
    // log('===========================');
    // baalar.insert(baalar.length, 200);
    // log('baalar.length = ${baalar.length}');
    // log('===========================');
    // log('baalar = $baalar');

    // log('baalar.first = ${baalar.first}');
    // log('baalar.last = ${baalar.last}');
    // log('baalar.akirki value = ${baalar[baalar.length - 1]}');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sabak'),
      ),
      body: const Center(
        child: Text('6-chi sabak'),
      ),
    );
  }
}

// class Car {
//   String model;
//   int doors;
//   String motorType;
// }

// Koldonuuchu, polzovatel', user
// 1 million
// Identity

class User {
  late String id;
  late String name;
  late int phone;
  // String lastname;

  /// A.
  /// A.1.
  // User(this.id, this.phone, this.name);
  /// A.2.
  // User([this.id, this.phone, this.name]);

  /// B.
  /// B.1.
  User({
    required this.id,
    required this.phone,
    required this.name,
  });

  /// B.
  /// B.2.
  // User({this.id, this.phone, this.name});

  // User user1 = User(kelgenId: '01', kelgenName: 'John');
  // User user2 = User(kelgenId: '02', kelgenName: 'Jane');
  // User({
  //   required String kelgenId,
  //   required String kelgenName,
  // }) {
  //   id = kelgenId;
  //   name = kelgenName;
  // }
}

// User user2 = User(id: 0002, name: 'Jonbek');

/// UI
/// Business logic
///

class SuroolordunServisi {
  void joopTuurabiTeksher() {}

  String kiyinkiSuroonuAlipKel() {
    return 'Atin kim?';
  }
}



/// if else, eger je bolboso
/// limonad je tarhun
/// Suusunduk linomadAlipKel(){
///   1. limonad barbi?
///   2. bar bolso al
///   3. jok bolso
///   4. tarhun barbi?
///   5. tarhun bolso
///   6. tarhun al
/// 
///   if(limonad) { 
///    return Limonad();
///   } else {
///    return Tarhun();
///   }
/// 
/// 
/// 
/// }