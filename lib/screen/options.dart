import 'package:flutter/material.dart';

class PicturesOptions{
  final String word;
  final String image;










  PicturesOptions({
    required this.word,
    required this.image,
  });

  List<Object?> get pic => [word,image];








  static List<PicturesOptions> picListBeginAlf = [
    PicturesOptions(word: "أسد", image: "images/rabbit.jpg" ),
  ];

  static List<PicturesOptions> picListBeginBaa = [
    PicturesOptions(word: "بطة", image: "images/duck1.jpg"),
  ];

  static List<PicturesOptions> picListBeginTaa = [
    PicturesOptions(word: "تفاحة", image: "images/apple.jpg"),
  ];

  static List<PicturesOptions> picListBeginTh = [
    PicturesOptions(word: "ثعلب", image: "images/fox.jpg"),
  ];


  static List<PicturesOptions> picListMedAlf = [
    PicturesOptions(word: "فأر", image: "images/mouse2.jpg"),
  ];

  static List<PicturesOptions> picListMedBaa = [
    PicturesOptions(word: "خبز", image: "images/bread1.jpg"),
  ];

  static List<PicturesOptions> picListMedTaa = [
    PicturesOptions(word: "دفتر", image: "images/notebook.jpg"),
  ];

  static List<PicturesOptions> picListMedTh = [
    PicturesOptions(word: "كمثري", image: "images/pear.jpg"),
  ];


  static List<PicturesOptions> picListEndAlf = [
    PicturesOptions(word: "عصا", image: "images/stick.jpg"),
  ];

  static List<PicturesOptions> picListEndBaa = [
    PicturesOptions(word: "كلب", image: "images/bear.jpg"),
  ];

  static List<PicturesOptions> picListEndTaa = [
    PicturesOptions(word: "زيت", image: "images/oil.jpg"),
  ];

  static List<PicturesOptions> picListEndTh = [
    PicturesOptions(word: "مثلث", image: "images/traingle.jpg"),
  ];











}
