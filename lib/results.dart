import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatefulWidget {

  final String bill;
  final String tax;
  final double friends;
  final double tip;
  ResultPage(this.bill,this.tax,this.friends,this.tip);
  @override
  State<ResultPage> createState() => _ResultPageState();
}
class _ResultPageState extends State<ResultPage> {
  String dividedamount ='';
  @override

  void initState(){
    super.initState();
    divideamount();
  }
  divideamount()
  {
    double taxamount=double.parse(widget.bill)*(double.parse(widget.tax)/100);
    double finalbill=(double.parse(widget.bill)+taxamount+widget.tip)/widget.friends;
    setState((){
      dividedamount=finalbill.toStringAsFixed(2);
    });
  }

  TextStyle infostyle=GoogleFonts.montserrat(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 40),
              child:Text('Result',style: GoogleFonts.montserrat(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.amber
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Equally Divided",style: GoogleFonts.montserrat(
                              fontSize: 20,fontWeight: FontWeight.w700),),
                          Text("\$$dividedamount",style: GoogleFonts.montserrat(
                              fontSize: 30,fontWeight: FontWeight.w700),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Friends",style: infostyle),
                              Text("Tax",style: infostyle),
                              Text("Tip",style: infostyle),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.friends.round().toString(),style: infostyle),
                              Text("${widget.tax}%",style: infostyle),
                              Text("\$${widget.tip.round().toString()}",style: infostyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text('Everybody Should pay \$$dividedamount',
              style:GoogleFonts.montserrat(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                ),
                onPressed: () =>Navigator.pop(context),
                child: Center(child: Text('Calculate Again ?',
                    style:GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w700),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
