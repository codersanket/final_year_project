import 'package:final_year_project/domain/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key? key, required this.productM}) : super(key: key);
  final ProductM productM;
  static const route = '/viewProduct';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productM.model ?? "")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: QrImage(data: productM.id ?? ""),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Model:" + productM.model!,
                  style: const TextStyle(fontSize: 24),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Brand: " + productM.brand!,
                  style: const TextStyle(fontSize: 18)),
            ),
            FutureBuilder(builder: (_, snap) {
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
