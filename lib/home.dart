import 'package:bill/results.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BillSplit extends StatefulWidget {
  const BillSplit({Key? key}) : super(key: key);

  @override
  State<BillSplit> createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {

  double friendsvalue=0.0;
  double tip=0.0;
  String tax='0';
  String bill='';

  buildButton(String text){
    return Expanded(
      child: OutlinedButton(style: OutlinedButton.styleFrom(
        padding: EdgeInsets.all(20),
      ),
        onPressed: (){
        if(text=='-'){
          setState((){
            bill='';
          });
        }else{
          setState((){
            bill+=text;
          });
        }

        },
        child: Text(text,
        style:GoogleFonts.montserrat(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w700),),),
    );
  }

  TextStyle infostyle=GoogleFonts.montserrat(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 40),
                child: Text("Split Bill",style: GoogleFonts.montserrat(
                  fontSize: 25,fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.amber
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total",style: GoogleFonts.montserrat(
                              fontSize: 20,fontWeight: FontWeight.w700),),
                          Text(bill,style: GoogleFonts.montserrat(
                              fontSize: 25,fontWeight: FontWeight.w700),),
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
                              Text(friendsvalue.round().toString(),style: infostyle),
                              Text("$tax%",style: infostyle),
                              Text("\$${tip.round().toString()}",style: infostyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text('How Many Friends ?', style:
              GoogleFonts.montserrat(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700) ,
              ),
              Slider(
                min: 0,
                max:20,
                divisions: 20,
                activeColor: Colors.orange,
                inactiveColor: Colors.black54,
                value: friendsvalue,
                onChanged: (value){
                  setState((){
                    friendsvalue=value;
                  });
                },
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Text('TIP',style: GoogleFonts.montserrat(
                            fontSize: 20,fontWeight: FontWeight.w700),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    tip--;
                                  });
                                },
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.remove,color: Colors.black,),
                              ),
                            ),
                            Text("\$${tip.round().toString()}",style: GoogleFonts.montserrat(
                                fontSize: 20,fontWeight: FontWeight.w700),),
                            Container(
                              width: 40,
                              height: 40,
                              child: FloatingActionButton(
                                onPressed: () {
                                  setState((){
                                    tip++;
                                  });
                                },
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.add,color: Colors.black,),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: MediaQuery.of(context).size.width/3,
                    height: 70,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        keyboardType:TextInputType.number,
                        onChanged: (value){
                          setState((){
                            tax=value;
                          });
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                          labelText: "Tax in %",
                          labelStyle:  GoogleFonts.montserrat(
                              fontSize: 15,fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                ],
              ),
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                ],
              ),
              Row(
                children: [
                  buildButton('.'),
                  buildButton('0'),
                  buildButton('-'),

                ],
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: ()=>Navigator.push(
                    context, MaterialPageRoute(builder: (context)=>ResultPage(bill,tax,friendsvalue,tip))),
                child: Center(
                child: Text('Split Bill',
                style: TextStyle(fontFamily: 'Pacifico',fontSize: 20,color: Colors.white),
                // style: GoogleFonts.montserrat(
                //     fontSize: 20,
                //     fontWeight: FontWeight.w700,
                //     color: Colors.white),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
