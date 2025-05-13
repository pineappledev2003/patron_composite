import 'package:composite_2/patron_composite/hojas/file.dart';
import 'package:flutter/material.dart';

class TextFile extends File {
  const TextFile({super.key, required super.title, required super.size})
    : super(icon: Icons.description);
}
