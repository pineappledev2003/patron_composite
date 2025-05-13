import 'package:composite_2/patron_composite/hojas/file.dart';
import 'package:flutter/material.dart';


class AudioFile extends File {
  const AudioFile({super.key, required super.title, required super.size})
    : super(icon: Icons.music_note);
}
