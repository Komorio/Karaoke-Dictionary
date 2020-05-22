import 'dart:convert';
import 'dart:io';

import 'package:karaoke_dictionary/widgets/songdata.dart';
import 'package:path_provider/path_provider.dart';

class FileManager{
  static Function refreshFunction;
  static String documentPath;

  static Future<String> get _localPath async {
    final documentPath = await getApplicationDocumentsDirectory();
    FileManager.documentPath = documentPath.path; 
    return documentPath.path;
  }

  static Future<File> get _localMemoryFile async{
    final path = await _localPath;
    return File('$path/memoriesSaveFile.text') ?? null;
  }

  static void SaveMemories() async{
    final file = await _localMemoryFile;
    String saveItem = "";
    SongData.songDatas.forEach((memory){
      saveItem += json.encode(memory) + "\n";
    });

    file.writeAsStringSync(saveItem);
  }

  static Future<String> _LoadMemories() async{
    String contents;
    try{
      final file = await _localMemoryFile;
      contents = await file?.readAsString();
    }
    catch(e){
      print(e);
    }

    return contents ?? "";
  }

  static void loadingMemories() async{
    final dataString = await _LoadMemories();
    final datas = dataString.split('\n');
    datas.forEach((data) {
      if(data.length > 0){
        SongData.songDatas.add(json.decode(data));
      }
    });

    refreshFunction();
  }

}