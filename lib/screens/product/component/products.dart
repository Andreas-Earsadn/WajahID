import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wajah_id/model/colorPallete.dart';


class products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 16, left: 16),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15,
              childAspectRatio: 0.8,
              children: <Widget>[
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum1.png', false, false, context),
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum2.png', false, false, context),
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum3.png', false, false, context),
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum4.png', false, false, context),
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum5.png', false, false, context),
                buildcard('Bio Beauty Lab', 'acne treatment/10m', '\Rp195.000',
                    'assets/skin_products/images/serum6.png', false, false, context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildcard(String name, String title, String price, String imagPath,
      bool added, bool isFavorite, context) {
    return Padding(
      padding: EdgeInsets.only(top: 6, bottom: 7, left: 5, right: 5),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: WajahColors.WajahDisabledSecondaryButtonText,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: WajahColors.WajahDisabledSecondaryButtonText,
                          ),
                  ],
                ),
              ),
              Hero(
                tag: imagPath,
                child: Container(
                  height: 70,
                  width: 75,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imagPath), fit: BoxFit.contain)),
                ),
              ),
              SizedBox(height: 5),
              Text(
                price,
                style: TextStyle(
                    color: WajahColors.WajahHoverSecondaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 13),
              ),
              Text(
                name,
                style: TextStyle(
                  color: WajahColors.WajahHoverSecondaryText,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 11),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  color: Colors.grey,
                  height: 1,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      SvgPicture.asset(
                        'assets/icons/keranjang.svg',
                        color: WajahColors.WajahDisabledSecondaryButtonText,
                      ),
                      Text(
                        'Add to chart',
                        style: TextStyle(
                            color:
                                WajahColors.WajahDisabledSecondaryButtonText),
                      )
                    ],
                    if (added) ...[
                      Icon(
                        Icons.remove_circle_outline,
                        color: WajahColors.WajahDisabledSecondaryButtonText,
                      ),
                      Text(
                        '1',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:
                                WajahColors.WajahDisabledSecondaryButtonText),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        color: WajahColors.WajahDisabledSecondaryButtonText,
                      )
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class Product {
  //final String image, title;
  //final int price, id;
  //Product(
    //  {required this.id,
     // required this.image,
     // required this.price,
     // required this.title});
//}

//List<Product> products = [
  //Product(
    //  id: 1,
      //title: "Bio Beauty Lab",
    //  price: 195000,
     // image: 'assets/images/serum1.png'),
 // Product(
   //   id: 2,
    //  title: "Something",
     // price: 195000,
     // image: 'assets/images/serum2.png'),
 // Product(
  //    id: 3,
    //  title: "Luxurious",
    //  price: 195000,
     // image: 'assets/images/serum 3.png'),
 // Product(
   //   id: 4,
     // title: "Scarlet Whitening",
    //  price: 195000,
      //image: 'assets/images/serum4.png'),
//  Product(
  //    id: 5,
    ///  title: "Skintific",
     // price: 195000,
      //image: 'assets/images/serum5.png'),
 // Product(
   //   id: 6,
     // title: "Bio Beauty Lab",
  //    price: 195000,
    //  image: 'assets/images/serum6.png'),
//];
