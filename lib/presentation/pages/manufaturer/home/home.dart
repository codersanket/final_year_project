import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/domain/blockchain/connection.dart';
import 'package:final_year_project/domain/model/product_model.dart';
import 'package:final_year_project/infrastructure/constants/storage_constants.dart';
import 'package:final_year_project/presentation/pages/manufaturer/add_product/add_product_page.dart';
import 'package:final_year_project/presentation/pages/manufaturer/view_product/view_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ManHome extends StatefulWidget {
  const ManHome({Key? key}) : super(key: key);
  static const String routeName = '/manHome';
  @override
  _ManHomeState createState() => _ManHomeState();
}

class _ManHomeState extends State<ManHome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddProductPage.route);
          },
          child: const Icon(Icons.add),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: ListTile(
              title: const Text("Log Out"),
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text("Welcome"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recently Addded Products",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              StreamBuilder(
                stream: StorgaeConstants().productsStorage.snapshots(),
                builder: (_, AsyncSnapshot<QuerySnapshot> data) {
                  if (data.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (data.hasData) {
                    var snapshot = data.data!.docs;
                    if (snapshot.isEmpty) {
                      return const Expanded(
                          child: SizedBox(
                              child: Center(
                                  child: Text(
                        "No Products Avilable",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ))));
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, i) {
                        final product =
                            ProductM.fromJson(snapshot[i].data() as Map);
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, ViewProduct.route,
                                  arguments: product);
                            },
                            trailing: const Icon(Icons.arrow_forward_ios),
                            title: Text(
                              product.model ?? "",
                              style: const TextStyle(),
                            ),
                            subtitle: Text(product.brand ?? ""),
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
