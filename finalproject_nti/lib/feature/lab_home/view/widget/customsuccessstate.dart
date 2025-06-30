import 'package:finalproject_nti/feature/favorite/view/widget/customimagecontainerfavorite.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customimagecontainer.dart';
import 'package:flutter/material.dart';
import 'package:finalproject_nti/feature/lab_details/view/labdetails.dart';

class CustomSuccessState extends StatelessWidget {
  final bool isHome;
  final List state;

  const CustomSuccessState({super.key, required this.state, this.isHome = true});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width : double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: isHome ? Axis.horizontal : Axis.vertical,
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final lab = state[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LabDetails(data: lab),
                      ),
                    ),
                    child: SizedBox(
                      width : 300,
                      height : 350,
                      child: Card(
                        color:isHome? Colors.black : Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            isHome? CustomImageContainer(image: lab['image'], id: lab['_id'])
                              :CustomImageContainerFavorite(image: lab['image'], id: lab['_id']),
                              const SizedBox(height : 10),
                              Text(
                                lab['name'] ?? 'Lab Name',
                                style: TextStyle(fontSize: 20, color: isHome ? Colors.white : Colors.black),
                              ),
                              const SizedBox(height : 5),
                              lab['sales']>0?
                              Row(
                                children: [
                                  Text(
                                    '${(lab['price']-(lab['price']*(lab['sales']/100))).toStringAsFixed(2)}\$',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: isHome ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  SizedBox(width : 10),
                                  Text(
                                    '${lab['price']}\$',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: isHome ? Colors.white : Colors.black,
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Colors.red,
                                    ),
                                  ),
                                ],
                              ):Text(
                                '${lab['price']}\$',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: isHome ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
