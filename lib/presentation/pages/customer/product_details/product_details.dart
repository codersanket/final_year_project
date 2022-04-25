import 'package:final_year_project/domain/blockchain/connection.dart';
import 'package:final_year_project/locator.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key, required this.code}) : super(key: key);
  static const String routeName = '/productDetails';
  final String code;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  List? listOfData;

  void getData() async {
    final response = await getIt<BlockChain>()
        .runQuery(function: 'getNotOwnedCodeDetails', args: [widget.code]);

    listOfData = response;
    if (response.first.isEmpty) {
      listOfData = [];
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: listOfData != null
            ? Text(listOfData!.isEmpty ? "Fake Product" : listOfData!.first)
            : const Text("Loading...."),
      ),
      body: listOfData == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    listOfData!.isEmpty ? "Fake Product" : " Genuine Product",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  if (listOfData!.isNotEmpty) ...[
                    Text(
                      "Product Information",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Text(
                      "Brand: " + listOfData!.first,
                      style: const TextStyle(color: Colors.black),
                    ),
                    Text("Model: " + listOfData![1]),
                    Text("Description: " + listOfData![3]),
                    Text("Location: " + listOfData![5]),
                    Text("Time Stamp: " + listOfData![6])
                  ]
                ],
              ),
            ),
    );
  }
}
