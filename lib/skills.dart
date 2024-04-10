import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Skills {
  String? id;
  String? text;
  String? rating;


  Skills({
    this.id,
    required this.text,
    this.rating,
  });

  static List<Skills> skillsList() {
    return [
      Skills(id: '1', text: 'Cooking by Saloni', rating: '4.2'),
      Skills(id: '2', text: 'Painting by Riya', rating: '3.4'),
      Skills(id: '3', text: 'Coding by Vaibhav', rating: '4.6'),
      Skills(id: '4', text: 'Dance by Ritik', rating: '3.9'),
      Skills(id: '5', text: 'Music by Kishore', rating: '4.1'),
      Skills(id: '6', text: 'Piano by Abhinav', rating: '3.5'),
      Skills(id: '7', text: 'Guitar by Raghav', rating: '3.1'),
      Skills(id: '8', text: 'Embroidery by Megha', rating: '4.6'),
      Skills(id: '9', text: 'Gardening by Kashvi', rating: '4.9'),

    ];
  }

  String getImagePath() {
    switch (text) {
      case 'Cooking by Saloni':
        return 'assetss/images/cooking.jpg';
      case 'Painting by Riya':
        return 'assetss/images/paint.jpg';
      case 'Coding by Vaibhav':
        return 'assetss/images/coding.jpg';
      case 'Dance by Ritik':
        return 'assetss/images/dance.jpg';
      case 'Music by Kishore':
        return 'assetss/images/music.jpg';
      case 'Piano by Abhinav':
        return 'assetss/images/piano.jpg';
      case 'Guitar by Raghav':
        return 'assetss/images/guitar.jpg';
      case 'Embroidery by Megha':
        return 'assetss/images/embroidery.jpg';
      case 'Gardening by Kashvi':
        return 'assetss/images/gardening.jpg';
      default:
        return 'assetss/images/default.png'; // Default image path
    }
  }

  static void addNewSkill(Skills newSkill, List<Skills> skills) {
    skills.add(newSkill);
  }

}