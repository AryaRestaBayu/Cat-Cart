import 'package:flutter/material.dart';
import 'package:submission_beginner/model/product_model.dart';
import 'package:submission_beginner/utils/formater.dart';
import 'package:submission_beginner/utils/toast.dart';
import 'package:submission_beginner/view/home/home_page.dart';

class FormCheckout extends StatefulWidget {
  const FormCheckout({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<FormCheckout> createState() => _FormCheckoutState();
}

class _FormCheckoutState extends State<FormCheckout> {
  int qty = 0;
  int total = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 350,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Rp. ${Formater.format(widget.product.price)}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Jumlah: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                const SizedBox(
                  width: 5,
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
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Total: ',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                Text(
                  'Rp. ${Formater.format(total)}',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                height: 50,
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
      ),
    );
  }
}
