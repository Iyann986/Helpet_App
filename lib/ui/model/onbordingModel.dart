// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';

class OnbordingModel {
  String img;
  String title;
  String desc;

  OnbordingModel({
    required this.img,
    required this.title,
    required this.desc,
  });
}

List<OnbordingModel> contents = [
  OnbordingModel(
    img: 'assets/images/img1.png',
    title: "Find pet lover community",
    desc: "Sharing about your pet with others pet lovers",
  ),
  OnbordingModel(
    img: 'assets/images/img2.png',
    title: "Understand your ped behaviour",
    desc: "Tips and trick about pets life, first aid, and more",
  ),
  OnbordingModel(
    img: 'assets/images/img3.png',
    title: "Be close with your pet",
    desc: "Schedulling and tracking your pet life and rutinity",
  ),
];
