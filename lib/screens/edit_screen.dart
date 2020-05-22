import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:karaoke_dictionary/consts/file_manager.dart';
import 'package:karaoke_dictionary/widgets/songdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class EditScreen extends StatefulWidget{
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>{
  
  TextEditingController _songNameController;
  TextEditingController _tjNumberController;
  TextEditingController _kyNumberController;

  @override
  void initState(){
    super.initState();

    _songNameController = TextEditingController();
    _tjNumberController = TextEditingController();
    _kyNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 60,),

            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: _songNameController,
                  decoration: InputDecoration(
                    labelText: "Song name",
                  ),
                )
              ),
            ),
            
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: _tjNumberController,
                  decoration: InputDecoration(
                    labelText: "TJ song number",                    
                  ),
                  keyboardType: TextInputType.number,
                )
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: TextField(
                  controller: _kyNumberController,
                  decoration: InputDecoration(
                    labelText: "KY song number",
                  ),
                  keyboardType: TextInputType.number,
                )
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(width:1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: () {
                    saveSongData();
                  },

                  child: Center(
                    child:Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 25,
                      )
                    )
                  ),
                )
                  
              ),
            ),
          ],
        ),
      )
    );
  }


  void saveSuccess(){
    showCupertinoDialog(
      context: context, 
      builder: (_) => CupertinoAlertDialog(
        title: Text(
            "Save Success!!!",
            style: TextStyle(
              color: Colors.blueAccent[300],
            )
          ),

        actions: <Widget>[
          CupertinoButton(
            child: Text("Yes"),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }


  void saveSongData() async{
    final path = await getApplicationDocumentsDirectory();
    final String fileName = path.path + "/saveFile";

    print(path.path);

    _songNameController.text ??= "";
    _tjNumberController.text ??= "";
    _kyNumberController.text ??= "";

    var saveItemString = "{ \"name\" : \"${_songNameController.text}\", \"tjNumber\" : \"${_tjNumberController.text}\", \"kyNumber\" : \"${_kyNumberController.text}\"}";
    var saveItem = json.decode(saveItemString);

    SongData.songDatas.add(saveItem);

    _songNameController.clear();
    _tjNumberController.clear();
    _kyNumberController.clear();
    
    FileManager.SaveMemories();

    saveSuccess();
  }
}