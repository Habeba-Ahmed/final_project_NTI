import 'package:flutter/material.dart';

class LabDetails extends StatelessWidget {
  final data;
  const LabDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              height : MediaQuery.of(context).size.height * 0.4,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: data['images'].length,
                itemBuilder: 
                (context,index){
                  return SizedBox(
                height : MediaQuery.of(context).size.height * 0.2,
                width : MediaQuery.of(context).size.width * 0.9,
                child: Card(child: Image.network(data['images'][index])),
                  );
                }, separatorBuilder: (BuildContext context, int index) {return SizedBox(width : 5,) ;})
            ),
            const SizedBox(height : 20),
            Text(
                  'Status: ${data['status']}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            const SizedBox(height : 10),
            Text(
              'name: ${data['name']}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height : 20),
            Text(
              data['description'],
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height : 20),
            Row(
              children: [
                Text('price: ',style: TextStyle(fontSize: 20,color: Colors.black),),
                Text('${data['price']}EG',style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),)
              ],
            )
          ]
        ),
      ),
    );
  }
}