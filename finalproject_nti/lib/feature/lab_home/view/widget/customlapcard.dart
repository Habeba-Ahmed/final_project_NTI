import 'package:flutter/material.dart';
import 'package:finalproject_nti/feature/favorite/view/widget/customimagecontainerfavorite.dart';
import 'package:finalproject_nti/feature/lab_home/view/widget/customimagecontainer.dart';
import 'package:finalproject_nti/feature/lab_details/view/labdetails.dart';

class CustomLabCard extends StatelessWidget {
  final Map<String, dynamic> lab;
  final bool isHome;

  const CustomLabCard({
    super.key,
    required this.lab,
    required this.isHome,
  });

  @override
  Widget build(BuildContext context) {
    final price = lab['price'];
    final sales = lab['sales'];
    final discountedPrice = price - (price * (sales / 100));

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => LabDetails(data: lab)),
        );
      },
      child: SizedBox(
        width : 300,
        height : 350,
        child: Card(
          color: isHome ? Colors.black : Colors.white,
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
                isHome
                    ? CustomImageContainer(image: lab['image'], id: lab['_id'])
                    : CustomImageContainerFavorite(image: lab['image'], id: lab['_id']),
                const SizedBox(height : 10),
                Text(
                  lab['name'] ?? 'Lab Name',
                  style: TextStyle(
                    fontSize: 20,
                    color: isHome ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height : 5),
                sales > 0
                    ? Row(
                        children: [
                          Text(
                            '${discountedPrice.toStringAsFixed(2)}\$',
                            style: TextStyle(
                              fontSize: 20,
                              color: isHome ? Colors.white : Colors.black,
                            ),
                          ),
                          const SizedBox(width : 10),
                          Text(
                            '${price}\$',
                            style: TextStyle(
                              fontSize: 15,
                              color: isHome ? Colors.white : Colors.black,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.red,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        '${price}\$',
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
  }
}
