import 'package:flutter/material.dart';

class ErrorWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            color: Colors.black,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Xem ra không có Pokemon bạn cần rồi!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 75,
              vertical: 10,
            ),
            child: Text(
              'Bạn cần phải ghi đúng tên hoặc id để tìm nhé!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.red,
              onPrimary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              shadowColor: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Trở về',
            ),
          ),
        ],
      ),
    );
  }
}
