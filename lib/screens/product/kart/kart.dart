import 'package:flutter/material.dart';
import 'package:wajah_id/model/colorPallete.dart';
import 'package:wajah_id/screens/product/SkinProduct.dart';


class mycart extends StatefulWidget {
  static var routeName;

  @override
  _mycartState createState() => _mycartState();
}

class _mycartState extends State<mycart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => skinproduct(),
              ),
            );
          },
        ),
        title: Text(
          'My Cart',
          style: TextStyle(color: WajahColors.WajahDisabledButtonText),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    onPressed: () {
                      print('All');
                    },
                    color: WajahColors.WajahDisabledButtonText,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    onPressed: () {
                      print('Discount');
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Discount',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                    onPressed: () {
                      print('Repuchase');
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Repurchase',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Cartitem(),
            Cartitem(),
            Cartitem(),
            Cartitem(),
            Cartitem(),
            Cartitem(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Total : ',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
                SizedBox(width: 4),
                Text(
                  '\Rp. 0 ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: WajahColors.WajahHoverSecondaryText),
                ),
                SizedBox(
                  width: 4,
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  color: WajahColors.WajahDisabledButtonText,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Cartitem extends StatelessWidget {
  const Cartitem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.scaleDown,
                        image:
                            AssetImage('assets/skin_products/images/wishlist_avo1 (1).png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Miraculous Refening Toner 100 ml',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: WajahColors.WajahDisabledSecondaryButtonText,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: WajahColors.WajahDisabledSecondaryButtonText,
                          borderRadius: BorderRadius.circular(20)),
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\Rp159,000',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
