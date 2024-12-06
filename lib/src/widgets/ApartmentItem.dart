import 'package:example/src/model/ApartmentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/TextStyles.dart';
import '../utils/formatUtils.dart';

class ApartmentItem extends StatefulWidget {
  const ApartmentItem({super.key, required this.item});
  final ApartmentModel item;
  @override
  State<ApartmentItem> createState() => _ApartmentItem();
}

class _ApartmentItem extends State<ApartmentItem> {
  bool showOption = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Container(
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.item.cover,
                  width: screenWidth - 32,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatCurrency(widget.item.price),
                            style: W700_S15_C000000,
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.item.name,
                            style: W400_S15_C000000,
                          ),
                        ],
                      ),
                      // Text("Resend")
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 40,
                          color: Color(0xFF797980),
                          child: TextButton(
                            onPressed: () => {},
                            child: Text(
                              "Reserved",
                              style: W500_S12_CFBFBFB,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.start, // Adjust as needed
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svgIcon/icon-bed.svg',
                        height: 13,
                        width: 15,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(
                        widget.item.rooms.toString(),
                        style: W400_S12_C797980,
                      ),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/svgIcon/icon-bath.svg',
                        height: 13,
                        width: 17,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(widget.item.bathroom.toString(),
                          style: W400_S12_C797980),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/svgIcon/icon-acreage.svg',
                        height: 13,
                        width: 20,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(widget.item.acreage.toString(),
                          style: W400_S12_C797980),
                      SizedBox(width: 16),
                      SvgPicture.asset(
                        'assets/svgIcon/icon-land.svg',
                        height: 13,
                        width: 16,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 4),
                      Text(widget.item.project, style: W400_S12_C797980),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24)
          ],
        ),
      ),
      Positioned(
          top: 30, // Position from the top of the parent
          right: 20, // Position from the right side of the parent
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {
                  print("Button clicked!");
                  setState(() {
                    showOption = !showOption;
                  });
                },
                child: Icon(
                  CupertinoIcons.ellipsis_vertical,
                  color: Color(0xFF797980),
                  size: 24.0,
                ),
              ),
              SizedBox(height:2),
              if (showOption)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () => {}, child: Text("Edit Property")),
                        Container(
                          height: 1,  // 1px height
                          width: 200,  // Takes up the full width
                          color: Color(0xFF797980),  // Line color
                        ),
                        TextButton(
                            onPressed: () => {}, child: Text("Delete Property"))
                      ],
                    ),
                  ),
                )
            ],
          )),
      Positioned(
        top: 30, // Position from the top of the parent
        left: 20, // Position from the right side of the parent
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          onPressed: () {
            print("Button clicked!");
          },
          child: Text(
            '1 day ago',
            style: W500_S12_C00000,
          ),
        ),
      )
    ]);
  }
}
