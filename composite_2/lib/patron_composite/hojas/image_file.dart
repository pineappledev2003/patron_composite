import 'package:composite_2/patron_composite/hojas/file.dart';
import 'package:flutter/material.dart';

class ImageFile extends File {
  const ImageFile({super.key, required super.title, required super.size})
    : super(icon: Icons.image);
}
