import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:submission_beginner/model/datasource.dart';
import 'package:submission_beginner/utils/formater.dart';
import 'package:submission_beginner/view/detail/detail_page.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    super.key,
    required this.crossAxisCount,
    required this.widthItem,
  });

  final int crossAxisCount;
  final double widthItem;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final List<String> listKategori = ['Semua', 'Makanan', 'Kesehatan', 'Alat'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 120,
              height: 80,
              child: Image(image: AssetImage('assets/logo.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 480,
              height: 35,
              child: Center(
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: listKategori.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                              border: Border.all(
                                  color: selectedIndex == index
                                      ? Colors.transparent
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Center(
                                  child: Text(
                                listKategori[index],
                                style: TextStyle(
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black),
                              ))),
                        ),
                      );
                    }),
              ),
            ),
            const SizedBox(height: 20),
            Container(
                width: widget.widthItem,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: AlignedGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:
                      listKategori[selectedIndex].toLowerCase() == 'semua'
                          ? DataSource.listProduct.length
                          : DataSource.listProduct
                              .where((element) =>
                                  element.category ==
                                  listKategori[selectedIndex].toLowerCase())
                              .toList()
                              .length,
                  crossAxisCount: widget.crossAxisCount,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                  itemBuilder: (context, index) {
                    final filterProduct = DataSource.listProduct
                        .where((element) =>
                            element.category ==
                            listKategori[selectedIndex].toLowerCase())
                        .toList();
                    final product = listKategori[selectedIndex] == 'Semua'
                        ? DataSource.listProduct[index]
                        : filterProduct[index];
                    return InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailPage(product: product))),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 4,
                        child: SizedBox(
                          height: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  // color: Colors.green,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 200,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    placeholder: 'assets/placeholder.jpg',
                                    image: product.imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                    'Rp ${Formater.format(product.price)}',
                                    style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
