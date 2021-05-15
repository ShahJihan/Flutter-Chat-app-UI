import 'package:chat_page/AppColorCodes.dart';
import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';


class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: pPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(pDefaultPadding,50,pDefaultPadding,20),
        child: Column(children: [
          Center(
            child: Stack(
               children:[ CircleAvatar(
                backgroundImage: AssetImage('assets/deepa.jpg'),
                radius: 90,
              ),
              Positioned(
              right: 0,
              bottom:0,
              child: Icon(Icons.camera_alt_rounded,size: 40,color: pPrimaryColor,),)
             ],
            ),
          ),
          SizedBox(height: pDefaultPadding*1.2,),
          Expanded(
          child: ListView(
            children: <Widget>[
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.person,color: pPrimaryColor,),
                  title: Text('Name'),
                  subtitle: Opacity(
                    opacity: 0.7,
                    child: Text(
                        'Deepa Pandey ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                ),
               ),
               Divider(
                     color: Colors.grey[300],
                      thickness: 1,
                      indent: 65,
                      endIndent: 5,
                    ),
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.info_outline_rounded,color: pPrimaryColor,),
                  title: Text('About'),
                  subtitle: Opacity(
                    opacity: 0.7,
                    child: Text(
                        'Accustomed 🤕 wid coding 👨‍💻 & covid 🦠 ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                  isThreeLine: true,
                ),
               ),
               Divider(
                     color: Colors.grey[300],
                      thickness: 1,
                      indent: 65,
                      endIndent: 5,
                    ),
              Card(
                color: Colors.transparent,
                elevation: 0,
                child: ListTile(
                  leading: Icon(Icons.phone,color: pPrimaryColor,),
                  title: Text('Phone'),
                  subtitle: Opacity(
                    opacity: 0.7,
                      child: Text(
                        '+91 12345 67890 ',
                        style: TextStyle(color:Theme.of(context).textTheme.bodyText1!.color),
                    ),
                  ),
                  trailing: Icon(Icons.edit),
                  //isThreeLine: true,
                ),
               ),
  ],
),
          )
        ],
        ),
      ),
    );
  }
  
}
