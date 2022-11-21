import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Map userData = {};
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getData();
  }

  getData() async {
    var userSnap = await FirebaseFirestore.instance
        .collection('admins')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      userData = userSnap.data()!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return Drawer(
        child: userData.isNotEmpty
            ? ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://i.postimg.cc/hvwN4XLn/ct-admin-drawer.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    accountName: Text(
                      userData['name'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    accountEmail: Text(
                      userData['email'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.info),
                    trailing: const Icon(Icons.arrow_forward),
                    title: const Text('About Us'),
                    onTap: () => {
                      showAboutDialog(
                        context: context,
                        applicationIcon: const FlutterLogo(),
                        applicationName: 'About Us',
                        applicationVersion: '1.0.0',
                        applicationLegalese:
                            'We, at CashTrash, connect people to professional recyclers and enable them to sell their household junk and get paid back for its value.',
                      ),
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    trailing: const Icon(Icons.arrow_forward),
                    title: const Text('Logout'),
                    onTap: () async {
                      await auth.signOut().then((value) => Navigator.of(context)
                          .popUntil((route) => route.isFirst));
                    },
                  ),
                ],
              )
            : const Center(child: CircularProgressIndicator()));
  }
}
