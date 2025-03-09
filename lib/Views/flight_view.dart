import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:modelview/Models/fligh_model.dart';

class FlightView extends StatefulWidget {
  const FlightView({super.key});

  @override
  State<FlightView> createState() => _FlightViewState();
}

class _FlightViewState extends State<FlightView> {
  var isloading = true;
  List<FlighModel> flightmodel = [];
  Future<void> flightapi() async {
    try {
      var url = "http://10.0.2.2:8080/postapidbb/index.php";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var getData = jsonDecode(response.body) as List;

        setState(() {
          flightmodel = getData.map((e) => FlighModel.fromJson(e)).toList();
        });

        print(response.body);
        print(flightmodel);
      }
    } catch (e) {
      print('Error:$e');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flightapi().then((value){
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
        titleSpacing: 20,
        title: Text("Flight Booking"),
        backgroundColor: const Color.fromARGB(255, 213, 211, 211),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.menu))
        ],
      ),
      body:isloading? Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: flightmodel.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipOval(
                            child: Image.asset(
                          "assests/excersie.jpg",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                            //Image.asset("assests/excersie.jpg"),
                            ),
                            SizedBox(width: 13),
                            Expanded(
                              child: Text(flightmodel[index].flignt_name,style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            SizedBox(width: 90),
                            Text('Price : ${flightmodel[index].Price}',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            
                            
                      ],
                    ),
                    
                    Row(
                      children: [
                        SizedBox(width: 70,),
                        Text(flightmodel[index].arrival,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        SizedBox(width: 20,),
                        Text("->"),
                        SizedBox(width: 20,),
                        Text(flightmodel[index].Destination,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 70,),
                    Text('Time : ${flightmodel[index].Time}')
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
