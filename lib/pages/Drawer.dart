import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/aboutus.dart';
import '../widgets/generealpre.dart';
import '../widgets/help.dart';
import '../widgets/mainpre.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                    ),
                    decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/blood.jpg',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Blood Donations',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              // // displayToastMessage("You have entered Washing Bay", context);
              // // Washing
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => main_precautions()));
            },
            leading: Icon(
              Icons.home_filled,
              color: Colors.black45,
            ),
            title: Text("Main precautions"),
          ),
          ListTile(
            onTap: () {
              // displayToastMessage("You have entered Laundry Shop", context);
              // //  Laundry
              // Navigator.of(context).push(\\
              //       MaterialPageRoute(
              //         builder: (context) => const DetailsPage(),
              //       ),
              //     );
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => DetailsPage()));
            },
            leading: Icon(
              Icons.wash,
              color: Colors.black45,
            ),
            title: Text("General precautions"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login_page/", (route) => false);

              // displayToastMessage("You are now Logged Out", context);
              // Navigator.push( context,
              //     MaterialPageRoute(builder: (_) => SignIn()));
              // Navigator.of(context).pushReplacementNamed(context,
              //               MaterialPageRoute(builder: (_) => SignIn()));
              // Navigator.pop(context);
              // Navigator.of(context).push(REGISTRATION());
            },
            leading: Icon(
              Icons.assignment_ind_rounded,
              color: Colors.black45,
            ),
            title: Text("Logout"),
          ),
          ListTile(
            onTap: () {
              // displayToastMessage("You have entered help", context);
              Navigator.of(context).push(HELP());
            },
            leading: Icon(
              Icons.help_outline,
              color: Colors.black45,
            ),
            title: Text("Help"),
          ),
          ListTile(
            onTap: () {
              //displayToastMessage("You have entered About Us", context);
              Navigator.of(context).push(ABOUT());
            },
            leading: Icon(
              Icons.accessibility_sharp,
              color: Colors.black45,
            ),
            title: Text("About Us"),
          ),
        ],
      ),
    );
  }
}
