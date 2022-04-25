import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:math';
import 'package:final_year_project/app/constants.dart';
import 'package:final_year_project/gen/assets.gen.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:web3dart/web3dart.dart';

@injectable
class BlockChain {
  BlockChain() : super() {
    httpClient = Client();
    web3client = Web3Client(Constants.infuraWalletApi, httpClient);
  }
  late Client httpClient;
  late Web3Client web3client;

  Future<DeployedContract> loadContract() async {
    final String abi = await rootBundle.loadString(Assets.contract.abi);
    final deployedContract = DeployedContract(ContractAbi.fromJson(abi, "FPA"),
        EthereumAddress.fromHex(Constants.deployedContarct));

    return deployedContract;
  }

  Future<List<dynamic>> runQuery({
    required String function,
    List<dynamic>? args,
  }) async {
    final deployedContract = await loadContract();
    final ethFunction = deployedContract.function(function);
    final result = await web3client.call(
        contract: deployedContract, function: ethFunction, params: args ?? []);
    return result;
  }

  Future<String> submitQuery(
      {required String function, List<dynamic>? args}) async {
    final deployedContract = await loadContract();
    final Credentials cred = EthPrivateKey.fromHex(Constants.privateKey);

    final result = await web3client.sendTransaction(
        cred,
        Transaction.callContract(
            contract: deployedContract,
            function: deployedContract.function(function),
            parameters: args ?? []),
        chainId: null,
        fetchChainIdFromNetworkId: true);
    return result;
  }
}
