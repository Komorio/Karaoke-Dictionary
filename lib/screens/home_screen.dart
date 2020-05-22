import 'package:flutter/material.dart';
import 'package:karaoke_dictionary/widgets/songdata.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  @override
  Widget build(BuildContext context){
    Widget getSongNumber(String text, Color color){
      if(text == "")
        text = "00000";

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text, 
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600, 
            ),
            textAlign: TextAlign.end,
          ),
          SizedBox(width: 10,),
          Container(
            color: color,
            height: 10,
            width: 30,
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Karaoke song number \ndictionary.",
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w600,
              )
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 350,
              width: MediaQuery.of(context).size.width * 0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: SongData.songDatas != null ? SongData.songDatas.length : 0,
                itemBuilder: (BuildContext context, int index){
                  Map songData = SongData.songDatas.toList()[index];
                  return GestureDetector( 
                    child: Container(
                      height: 110,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: 100,                        
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 10,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20)
                            )
                          ),

                          Positioned(
                            left: 20,
                            top: 35,
                            child: Text(
                              songData["name"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              )
                            ),
                          ),

                          Positioned(
                            right: 35,
                            top: 20,
                            child: Container(
                              height: 60,
                              width: 100,

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,

                                children: <Widget>[
                                  getSongNumber(songData["tjNumber"], Colors.red),
                                  SizedBox(height: 10),
                                  getSongNumber(songData["kyNumber"], Colors.blue),
                                ],
                              ),
                            )
                          ),

                        ],
                      ),
                    )
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
}