import 'package:flutter/material.dart';
import 'package:smr/model/recommed_model.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendedScreen extends StatefulWidget {
  final List<RecommendModel> selectedList;
  const RecommendedScreen({required this.selectedList,Key? key}) : super(key: key);

  @override
  State<RecommendedScreen> createState() => _RecommendedScreenState();
}

class _RecommendedScreenState extends State<RecommendedScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommended Colleges')),
      body: Container(
        child: GridView.builder(
          itemCount: widget.selectedList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (_, index) {

            return   recommendCard(index);
          },

        ),
      ),
    );
  }
  Widget recommendCard(int index){
    if(widget.selectedList.isNotEmpty) {
      return InkWell(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(widget.selectedList[index].CollageName),
              Image.asset('assets/${widget.selectedList[index].imagePath}',
                fit: BoxFit.contain,width: 100,height: 100,),
          ],)
        ),

        onTap: () {
          launchURL(widget.selectedList[index].url);
        },
      );
    }else{
      return Center(child: Text('No College Found', style: TextStyle(color: Colors.blue),));

    }

    }
  }

  Future<void>launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true,enableJavaScript: true,enableDomStorage: false);
    } else {
      throw 'could not launch $url';
    }
  }

