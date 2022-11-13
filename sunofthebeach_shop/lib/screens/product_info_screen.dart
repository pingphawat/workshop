import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunofthebeach_shop/themes/color.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({Key? key}) : super(key: key);

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/back.svg', color: kColorsBlack),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kColorsCream,
        elevation: 0, //ลบเงา
        toolbarHeight: 60,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/edit.svg',
              color: kColorsBlack,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/msg.svg',
              color: kColorsBlack,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/profile");
            },
            icon: SvgPicture.asset(
              'assets/icons/me.svg',
              color: kColorsBlack,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kColorsRed,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Book',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: kColorsGrey,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Product Name',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: kColorsPurple),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              '\$ price',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                color: kColorsRed,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Quantity : 2',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: kColorsPurple),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              'Description : ################################',
              style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  color: kColorsPurple),
            ),
          ],
        ),
      ),
    );
  }
}
