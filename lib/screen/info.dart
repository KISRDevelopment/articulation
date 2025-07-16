import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class InfoCard extends StatefulWidget {
  final letter;
  InfoCard({@required this.letter});

  //const SingleFlipCard({Key? key}) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> with AfterLayoutMixin<InfoCard> {
  String pathPDF = "";
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  @override
  void initState() {
    super.initState();

    fromAsset('file/Articulation_test_form_reviwed.pdf', 'Articulation_test_form_reviwed.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });






  }
  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          color: Colors.transparent,
          height: 1000,
          child: Container(
            //color: Colors.white,
            width: 1500,
            height: 700,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30, left: 10, right: 10, bottom: 0),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(360)
                        ),
                      ),
                      child: Icon(Icons.arrow_back_ios, size: 30),

                    ),
                  ],
                ),
                  onTap: (){
                    Navigator.of(context).pop(
                    );
                  },),
                Container(
                  child: Center(child: Text(widget.letter, style: TextStyle(fontSize: 50, ),)),
                  color: Colors.white,
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: [
                              Container(

                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                                  child: Image.asset("images/articulation.jpg", fit: BoxFit.cover, height: 500, width: 550)),
                            ],
                          ),
                        ),
                        color: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.all(2.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: [
                              Container(

                                padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                                child: Image.asset("images/Process_of_articulation.jpg", fit: BoxFit.cover, height: 400, width: 500),
                                color: Colors.white,
                              ),


                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  color: Colors.white,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height:10),
                    GestureDetector(
                      child:Text('View IPA',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontSize: 20,
                              ),
                            ),


                      onTap: (){
                        if (pathPDF.isNotEmpty){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PDFScreen(path: pathPDF),
                            ),
                          );
                        }


                      },
                    ),

                  ],
                ),
              ],

            ),
          ),


        ),
      ),
    );


  }

  @override
  void afterFirstLayout(BuildContext context) {
    var cardKey;
    cardKey.currentState?.toggleCard();
    // TODO: implement afterFirstLayout
  }
}

void _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if(await canLaunchUrl(uri)){
    await launchUrl(uri);
  }else{
    throw 'Could not launch $url';
  }
}



class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
  Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Document"),
        actions: <Widget>[
          /*IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),*/
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation: false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
                //totalPage = total;

              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Container()
              : Center(
            child: Text(errorMessage),
          )
        ],
      ),

    );
  }
}
