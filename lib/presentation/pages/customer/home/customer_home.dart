import 'package:final_year_project/presentation/pages/customer/product_details/qr_scanner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerHome extends StatelessWidget {
  const CustomerHome({Key? key}) : super(key: key);
  static const String routeName = '/custHome';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => QrScanner()));
          },
          child: const Icon(Icons.qr_code),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}
