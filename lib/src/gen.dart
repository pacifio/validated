import 'dart:io';
import 'dart:async';

// This file generates content for validated
main() async {
  var chunk = '';

  var systemTempDir = Directory.current;
  Stream<FileSystemEntity> entityList =
      systemTempDir.list(recursive: true, followLinks: false);
  await for (FileSystemEntity entity in entityList) {
    var pairs = entity.path.split('/');
    var fileName = pairs[pairs.length - 1];
    if (fileName.contains('is')) {
      chunk += "export './src/$fileName';\n";
    }
  }

  new File('../validated.dart').writeAsString(chunk).whenComplete(() {
    print("Job done");
  });
}
