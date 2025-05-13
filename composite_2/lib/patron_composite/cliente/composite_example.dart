import 'package:composite_2/patron_composite/compuesto/directory.dart';
import 'package:composite_2/patron_composite/hojas/audio_file.dart';
import 'package:composite_2/patron_composite/hojas/image_file.dart';
import 'package:composite_2/patron_composite/hojas/text_file.dart';
import 'package:composite_2/patron_composite/hojas/video_file.dart';
import 'package:flutter/material.dart';

class CompositeExample extends StatefulWidget {
  const CompositeExample({super.key});

  @override
  State<CompositeExample> createState() => _CompositeExampleState();
}

class _CompositeExampleState extends State<CompositeExample> {

  Widget _buildMediaDirectory() {

    final mediaDirectory = DirectoryComposite(title: "Media");

    final musicDirectory = DirectoryComposite(title: "Music");
    final music1 = AudioFile(title: "Tres Canciones", size: 25363);
    musicDirectory.agregarArchivo(music1);

    final wowPictures = DirectoryComposite(title: "World Of WarCraft");
    final wowPic1 = ImageFile(title: "wow.png", size: 65);
    final wowPic2 = ImageFile(title: "wow2.png", size: 65);
    final wowPic3 = ImageFile(title: "wow3.png", size: 65);

    wowPictures.agregarArchivo(wowPic1);
    wowPictures.agregarArchivo(wowPic2);
    wowPictures.agregarArchivo(wowPic3);

    final pictureDirectoy = DirectoryComposite(title: "Pictures");
    pictureDirectoy.agregarArchivo(wowPictures);

    mediaDirectory.agregarArchivo(musicDirectory);
    mediaDirectory.agregarArchivo(pictureDirectoy);

    mediaDirectory.removeFile(musicDirectory);

    return mediaDirectory;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PATRON COMPOSITE", style: TextStyle(color: Colors.black),)),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildMediaDirectory(),
        ),
      ),
    );
  }
}
