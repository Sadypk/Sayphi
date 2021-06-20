import 'package:flutter/material.dart';
import 'package:sayphi/mainApp/resources/appColor.dart';
import 'package:sayphi/sady/view/widgets/transaction_tile.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.SCAFFOLD_BACKGROUND,
      appBar: AppBar(
        title: Text('Transactions', style: TextStyle(color: AppColor.TEXT_COLOR, fontSize: 16, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5),),
                hintText: 'May 17, 2021',
                suffixIcon: Icon(Icons.keyboard_arrow_down, size: 30,)
              ),
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return TransactionTile();
                }
              ),
            )
          )
        ],
      ),
    );
  }
}
