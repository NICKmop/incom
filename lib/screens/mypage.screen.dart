import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mypageScreen extends StatefulWidget {
  const mypageScreen({Key? key}) : super(key: key);

  @override
  State<mypageScreen> createState() => _mypageScreenState();

}

class _mypageScreenState extends State<mypageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: ListView(
              children: <Widget>[
                imageProfile(),
                SizedBox(height: 20),
                nameTextField(),
                SizedBox(height: 20),
              ],
            )
        )
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80,
            // backgroundImage: AssetImage('assets/'),
          ),
          // Positioned(
              // bottom: 20,
              // right: 20,
              // child: InkWell(
                // onTap: () {
                  // showModalBottomSheet(context: context, builder: ((builder) => bottomSheet()));
                // },
                // child: Icon(
                //   Icons.camera_alt,
                //   color: secondaryTextColor,
                //   size: 40,
                // ),
              // )
          // )
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          labelText: 'Name',
          hintText: 'Input your name'
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 100,
        // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: <Widget>[
            Text(
              'Choose Profile photo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera, size: 50,),
                  onPressed: () {
                    // takePhoto(ImageSource.camera);
                  },
                  label: Text('Camera', style: TextStyle(fontSize: 20),),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.photo_library, size: 50,),
                  onPressed: () {
                    // takePhoto(ImageSource.gallery);
                  },
                  label: Text('Gallery', style: TextStyle(fontSize: 20),),
                )
              ],
            )
          ],
        )
    );
  }

  // takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }
}