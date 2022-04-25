import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Constants {
  static const walletAddress = "0x2BAeD4e98b5f143525E78eB4D68104790E7fFa81";
  static const infuraWalletApi =
      "https://goerli.infura.io/v3/800bb36bd25c48909e733773bbec035c";
  static const deployedContarct = "0x0EaD93ae48DDC2Cb7e8AF803dd0b867cC8019B14";
  static const privateKey =
      "c78feb344ecf045c6138100a11c51d969a6533d763d5ae0a360ba94cdf7322c8";
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
}
