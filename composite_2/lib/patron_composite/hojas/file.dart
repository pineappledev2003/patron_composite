import 'package:composite_2/converter.dart';
import 'package:composite_2/patron_composite/componente_base/interfaz_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;

  const File({super.key, required this.title, required this.size, required this.icon});

  @override
  int getSize() {
    return size;
  }

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: Text(title),
        leading: Icon(icon),
        trailing: Text(FileSizeConverter.bytesToString(size)),
      ),
    );
  }

  @override
  void removeFile(IFile file) {
    // TODO: implement removeFile
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
