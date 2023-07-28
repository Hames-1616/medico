import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:medico/utils/dimentions.dart';

class CurrentProduct extends StatefulWidget {
  const CurrentProduct({super.key});

  @override
  State<CurrentProduct> createState() => _CurrentProductState();
}

class _CurrentProductState extends State<CurrentProduct> {
  int x = 1;
  int max = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Ionicons.cart))
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            ImageSlideshow(
                indicatorColor: Colors.black54,
                indicatorBackgroundColor: Colors.grey,
                height: MediaQuery.of(context).size.height / hei(context, 200),
                width: double.infinity,
                children: [
                  Container(
                    // padding: const EdgeInsets.all(20),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Image.network(
                        "https://m.media-amazon.com/images/I/81mHKOc5NjL._AC_UF1000,1000_QL80_.jpg"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYDCo0iM7ikSLDbZvIRmVJcVhd9cwrdYsgIA&usqp=CAU"),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiiElRD8Nkxf4lrfI00pLpsvubPsjBH5LSvg&usqp=CAU"),
                  ),
                ]),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Vitamins bottle",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            // const SizedBox(height: 2,),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "By Medical Testing Unit",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 13.5,
                    color: Colors.black54),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  RatingBarIndicator(
                    rating: 0.0,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.black,
                    ),
                    itemCount: 5,
                    itemSize: 25.0,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "(0.0)",
                    style:
                        TextStyle(fontFamily: "Poppins", color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Divider(
               height: 50,
              thickness: 3,
              color: Colors.black54,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      " ₹500",
                      style: TextStyle(fontFamily: "Poppins", fontSize: 18),
                    )),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (x == 0) {
                            } else {
                              x--;
                            }
                          });
                        },
                        icon: const Icon(LineIcons.minus)),
                    Text(
                      x.toString(),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if (x >=max) {
                            } else {
                              x++;
                            }
                          });
                        },
                        icon: const Icon(LineIcons.plus))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
