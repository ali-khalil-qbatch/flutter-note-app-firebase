import 'package:flutter/material.dart';
import 'package:learning_flutter/utils/common.dart';

Widget getAuthScreenBanner() {
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(
        color: 'FF19212D'.toColor(),
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(70),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
      child: Column(
        children: [
          Image.asset(
            "assets/logo.png",
            height: 70,
            color: Colors.white,
            alignment: Alignment.centerLeft,
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Text(
              'Search & bid on thousands of vehicles online',
              style: TextStyle(
                color: 'FFA0D254'.toColor(),
                fontSize: 24,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              'We help customers to place bids on various items, such as cars and motorbikes. Additionally, it will facilitate the generation of invoices and collect pertinent data about customers who participate and emerge as winners in these auctions.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
