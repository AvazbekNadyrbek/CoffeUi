import 'package:firstprojectofflutterui/helpers/colors.dart';
import 'package:firstprojectofflutterui/models/coffe_model.dart';
import 'package:firstprojectofflutterui/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailsScreen({super.key, required this.coffee});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  String selectedIndex = 'M';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: xBackGroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          const SizedBox(
            height: 65,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new),
              ),
              const Text(
                'Details',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Icon(Iconsax.heart5),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Hero(
              tag: widget.coffee.image,
              child: Image.asset(
                widget.coffee.image,
                width: double.infinity,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.coffee.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.type,
                        style: TextStyle(
                          color: xSecondaryColor,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_star_filled.png',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${widget.coffee.rate}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            ' (${widget.coffee.review})',
                            style: TextStyle(
                              color: xSecondaryColor,
                              fontSize: 12,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      'assets/images/bike.png',
                      'assets/images/bean.png',
                      'assets/images/milk.png',
                    ].map((e) {
                      return Container(
                        margin: const EdgeInsets.only(left: 20),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.black12.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          e,
                          width: 25,
                          height: 25,
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                indent: 15,
                color: Colors.black12,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Description',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ReadMoreText(
                widget.coffee.description,
                style: TextStyle(
                  color: xSecondaryColor,
                  fontSize: 15,
                ),
                trimLines: 2,
                colorClickableText: xPrimaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Read less',
                moreStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xPrimaryColor,
                ),
                lessStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: xPrimaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Size',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  'S',
                  '',
                  'M',
                  '',
                  'L',
                ].map((e) {
                  if (e == '') return const SizedBox(width: 20);
                  bool isSelected = e == selectedIndex;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = e;
                        });
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: isSelected ? xPrimaryColor : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? xPrimaryColor : Colors.black12,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          e,
                          style: TextStyle(
                            fontSize: 14,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
      bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Price',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: xSecondaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$${widget.coffee.price}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: xPrimaryColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 240,
                child: CommonButton(
                  title: 'By my now',
                  onTap: () {},
                ),
              )
            ],
          )),
    );
  }
}
