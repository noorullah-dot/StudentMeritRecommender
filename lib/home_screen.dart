// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smr/aboutus.dart';
import 'package:smr/login_screen.dart';
import 'package:smr/model/merit_list.dart';
import 'package:smr/notifications.dart';
import 'package:smr/provider/providerScreen.dart';
import 'package:smr/screens/RecommendedCollage.dart';
import 'package:smr/screens/google_map/google_map_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

import 'main.dart';
//import 'package:geocoding/geocoding.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
String bisepurl = 'https://www.bisep.edu.pk/';
String edwardsCollegeurl = 'https://edwardes.edu.pk/Home';
String govtCollegeurl = 'https://gcp.kp.gov.pk/';
String hadafCollegeurl = 'https://hadaf.edu.pk/';
String islamiaCollegeurl = 'https://www.icp.edu.pk/';
String peshawardegreeCollegeboysurl = 'http://www.pmdc.edu.pk/';
String peshawardegreeCollegegirlsurl = 'http://www.pmdc.edu.pk/'; 
String icmsCollegeurl = 'https://icms.edu.pk/';
 String leedsCollegeurl = 'http://leeds.edu.pk/';
String globleCollegeurl = 'http://college.globalgroup.edu.pk/';
String brillientCollegeurl = 'https://topschools.pk/university/brilliant-college-of-science-dalazak-road-campus-peshawar/16417';
String quidazamCollegeurl = 'https://www.ilmkidunya.com/colleges/quaid-e-azam-degree-college-peshawar-fee-structure.aspx';
String fazaiaclgurl = 'https://fazaia.edu.pk/fazaiadegreecollegepeshawar/home';
String cdc = "https://www.capital.edu.pk/";
String NWI = "https://www.nwihs.edu.pk/";
String MC = "https://www.themuslim.edu.pk/";
String GFC = "https://www.facebook.com/Govt-Frontier-College-For-Women-Peshawar-645781155791863/";
//String GCP = "https://gandhara.edu.pk/GCP/index.html";
String PES = "https://pimspsh.edu.pk/";
String NES = "https://www.niceeducationsystem.edu.pk/";
String GIM = "https://www.kmu.edu.pk/ghazali-institute-medical-sciences-peshawar";
String PCM = "https://pcms.edu.pk/";
String PIM = "https://www.pimmspesh.edu.pk/";
String HIM = "https://www.hims.edu.pk/";
String PEFC = "https://pefcollege.edu.pk/";
String RIMS = "https://rims.edu.pk/";
String BPG = "https://brains.edu.pk/";
String FHM = "https://fhmc.edu.pk/";
String BCSP = "https://bcsp.edu.pk/";
String RNC = "https://rnc.prime.edu.pk/";
String ICHS = "https://ichs.edu.pk/";





class _HomeScreenState extends State<HomeScreen> {

  TextEditingController controller =TextEditingController();
  File? image;

   Future<void>launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true,enableJavaScript: true,enableDomStorage: false);
    } else {
      throw 'could not launch $url';
    }
  }

  List colleges_images = ['assets/biseppic.jpg',
  'assets/edward college.png','assets/govt pesh.jpg',
  'assets/hadaf.png','assets/islamiaclg.jpg',
  'assets/pmdc.jpg','assets/pmdcGirl.jpg',
   'assets/icms.jpg','assets/leedsclg.png','assets/globalclg.jpg',
   'assets/briliantclg.jpg','assets/quideazam.jpg','assets/fazaiaclg.jpg',
   'assets/cdc.jpg','assets/NWI.jpg','assets/MC.jpg',
   'assets/GFC.jpg','assets/PES.jpg',
   'assets/NES.jpg','assets/GIM.jpg','assets/PCM.jpg',
   'assets/PIM.jpg','assets/Hims.jpg','assets/PEF.jpg',
   'assets/RIMS.jpg','assets/BPG.jpg','assets/FHM.png',
   'assets/BCSP.png','assets/RNC.jpg','assets/ICHS.jpg'

   ];

   
  //  List colleges_names=['Bisep','Edwards College Boys','Govt.CollegePeshawar Boys','Hadaf College Boys','Islamia College Boys',
  //  'Peshawar model Degree College Boys','Peshawar Model Degree College Girls','www.ICMSCollege.com','www.LeedsCollege.com','www.GlobalCollege.com','www.BriliantCollege.com','www.Quid_E_AzamCollege.com','www.FazaiaCollege.com'];

   List colleges_url = [bisepurl,edwardsCollegeurl,govtCollegeurl,hadafCollegeurl,islamiaCollegeurl,peshawardegreeCollegeboysurl,peshawardegreeCollegegirlsurl,
   icmsCollegeurl,leedsCollegeurl,globleCollegeurl,brillientCollegeurl,quidazamCollegeurl,fazaiaclgurl];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton:FloatingActionButton(child: Icon(Icons.add_location),onPressed: () async{

       Navigator.push(context, MaterialPageRoute(builder: (context)=> GoogleMapScreen()));

      },),
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        title: Text('Student Merit Recommendation',style: TextStyle(fontSize: 14),),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            showAlertDialog(context,'Upload Marit List', 'upload', true);
          }, icon: Icon(Icons.add)),
          IconButton(onPressed: (){
            showAlertDialog(context, 'Marks',"Calculate",false);
          }, icon: Icon(Icons.search))
        ],
        bottom: PreferredSize(preferredSize: Size(14 ,10), child: Container(),),
        
      ),
      drawer:Drawer(
      child:Column(
        children:[
          DrawerHeader(decoration: BoxDecoration(color: Colors.white),
          child:  Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/SMR_logo.png'),
                      radius: 50,
                      //: Text('SMR',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Align(alignment: Alignment.center,
                    child: Text('Student Merit Recommendation',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)))
                ],
              ),
              ),
           ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            ),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications())); 
            },),
            SizedBox(height: 10,),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            ),onTap: (){
              Navigator.of(context).pop();
            },),
            SizedBox(height: 10,),

            ListTile(
            leading: Icon(Icons.contacts_rounded),
            title: Text('About us',style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
            
            ),onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Aboutus()));
            }),

            ListTile(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Loginscreen()));
            },
              leading: Icon(Icons.logout_outlined),
              title:Text('Logout',style: TextStyle(fontSize: 15,fontWeight:FontWeight.bold)
                ),),
            ],
      )
    ),
     body: ListView.builder(
       itemCount: colleges_images.length,
       itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              InkWell(
                child: Container(
                  padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(colleges_images[index],fit: BoxFit.fitWidth,),
                    ),
                    
                onTap: (){
                  launchURL(colleges_url[index]);
                },
              ),
            ],
          );
         
       }));


  }

    void showAlertDialog(BuildContext context, String title, String buttonName ,bool isMarksButton) {


      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text(title),
        content: isMarksButton ? UploadMeritListDialog(): GetMarksDialog(controller: controller,),

      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }


  }

class GetMarksDialog extends StatefulWidget {
  final TextEditingController controller;
  const GetMarksDialog({required this.controller ,Key? key}) : super(key: key);

  @override
  State<GetMarksDialog> createState() => _GetMarksDialogState();
}

class _GetMarksDialogState extends State<GetMarksDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:  [
      Text('Total Marks 1100'),
            TextField(
              controller: widget.controller,
              keyboardType: TextInputType.number,
          autofocus: true,
          decoration: InputDecoration(
              labelText: 'Obtain Marks', hintText: 'eg. 800'),
        ),

          MyButton(onTap: _navigateToRecommendScreen, iconData: Icons.calculate, title: 'Calculate')
      ],
    );
  }

  void _navigateToRecommendScreen(BuildContext context) {
    final  provider=context.read<GernalCalculation>();
    final selectedList=provider.recommendCollege(int.parse(widget.controller.text));
    Navigator.push(context,  MaterialPageRoute(builder: (context)=> RecommendedScreen(selectedList: selectedList ?? [],)));
    widget.controller.clear();
  }


  }



class UploadMeritListDialog extends StatefulWidget {

  const UploadMeritListDialog({Key? key}) : super(key: key);

  @override
  State<UploadMeritListDialog> createState() => _UploadMeritListDialogState();
}

class _UploadMeritListDialogState extends State<UploadMeritListDialog> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        border: Border.all(color: Colors.green),),
      child:_isImagePickWidget()
    );
  }


  Widget _isImagePickWidget() {
    if (imageFile != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain ,
                  image: FileImage(imageFile!)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10),
            child: MyButton(onTap: _imageOnTap, iconData: Icons.image, title: 'Upload'),
          )

        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children:  [
          _imageByGalleryWidget(),
          Text('OR'),
          _pickImageByCameraWidget(),
        ],
      );
    }
  }

  Widget _imageByGalleryWidget() {
      return MyButton(onTap:_uploadByGallery,iconData: Icons.image,title: 'Upload by Gallery',);

  }

  Widget _pickImageByCameraWidget() {

      return MyButton(onTap:_uploadByCamera,iconData: Icons.image,title: 'Upload by Camera',);

  }
  void _uploadByGallery(BuildContext context)async{

    final image = await pickImage(context, ImageSource.gallery);

   setState(() {
     imageFile =image;
   });

  }
  void _uploadByCamera(BuildContext context)async {
    final image = await pickImage(context, ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }
  // pick image from your device
  Future<File?> pickImage(context,ImageSource source) async {
    final pickedImage =
    await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      print('NO IMAGE Selected');
      return null;
    }
  }

  void _imageOnTap(BuildContext context) {
    final  provider=context.read<GernalCalculation>();
    provider.setMeritList(MeritListModel('', imageFile!));
    Navigator.pop(context);
    // final selectedList=provider.recommendCollege(int.parse(controller.text));
    // Navigator.push(context,  MaterialPageRoute(builder: (context)=> RecommendedScreen(selectedList: selectedList ?? [],)));}
  }
}


class MyButton extends StatelessWidget {
  final BuildContextCallback onTap;
  final IconData iconData;
  final String title;
  const MyButton({required this.onTap,required this.iconData,required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: ()=>onTap(context), child: ListTile(leading:Icon(iconData),title: Text(title))),
    );
  }
}
