import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/utils/formater.dart';
import 'package:submission_beginner/utils/toast.dart';
import 'package:submission_beginner/view/home/home_page.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key, required this.product});

  final Product product;

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  int qty = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * .40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                height: MediaQuery.of(context).size.height * 0.20,
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.jpg',
                  image: widget.product.imageUrl,
                ),
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 5),
                    Text('Rp ${Formater.format(widget.product.price)}',
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.green)),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Total:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Rp ${Formater.format(total)}',
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green)),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (qty == 0) {
                                return;
                              }
                              qty--;
                              total = widget.product.price * qty;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            child: const Center(
                              child: Icon(Icons.remove),
                            ),
                          ),
                        ),
                        Text(
                          qty.toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (qty == 10) {
                                return;
                              }
                              qty++;
                              total = widget.product.price * qty;
                            });
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(),
                            ),
                            child: const Center(
                              child: Icon(Icons.add),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          InkWell(
            onTap: () {
              if (qty == 0) {
                return Utils.toast('Minimal 1 Jumlah Pembelian', context);
              }
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false);
              Utils.toast('Berhasil Checkout', context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height * .08,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * .02),
              color: Colors.black,
              child: const Center(
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
