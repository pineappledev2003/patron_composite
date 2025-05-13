import 'package:composite_2/converter.dart';
import 'package:composite_2/patron_composite/componente_base/interfaz_file.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DirectoryComposite extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;
  List<IFile> files = [];

  DirectoryComposite({super.key, required this.title, this.isInitiallyExpanded = false});

  void agregarArchivo(IFile file) {
    files.add(file);
  }

  @override
  int getSize() {
    var sum = 0;

    for (var file in files) {
      sum += file.getSize();
    }

    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black)),
      child: ExpansionTile(
        leading: const Icon(Icons.folder),
        title: Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
        initiallyExpanded: isInitiallyExpanded,
        children: files.map((file) => file.render(context)).toList(),
      ),
    );
  }

  /// “Este patrón permite tratar archivos y carpetas por igual. 
  /// Gracias a la recursividad, podemos eliminar cualquier archivo sin importar 
  /// dónde esté dentro de la jerarquía.”
  
  //! Recursividad es cuando una función se llama a sí misma para resolver un problema más pequeño o una parte del mismo problema.

  @override
  void removeFile(IFile file) {
    files.remove(file); // Elimina si está directamente

    // Además, delega a hijos compuestos recursivamente
    for (var child in files) {
      child.removeFile(file);
    }
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
