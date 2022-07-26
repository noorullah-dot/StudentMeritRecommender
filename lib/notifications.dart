import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smr/provider/providerScreen.dart';

class Notifications extends StatefulWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),

        title: const Text('Merit Lists',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Consumer<GernalCalculation>(
        builder: (context,provider,child ){
          return  provider.meritlist.isNotEmpty ? ListView.builder(
              padding: const EdgeInsets.only(left: 50,right: 50, top: 10),
              itemCount: provider.meritlist.length,
              itemBuilder: (BuildContext context, index){
                final image= provider.meritlist[index].imageMeritList;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                          image: FileImage(image)),
                    ),
                  )

                  ],);
              }): Center(child: Text('No Merit list Upload', style: TextStyle(color: Colors.blue),));
        },

      ),
      
    );
  }
}