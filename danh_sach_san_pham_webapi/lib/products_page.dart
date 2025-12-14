import 'package:danh_sach_san_pham_webapi/api.dart';
import 'package:danh_sach_san_pham_webapi/model/product.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late API api;
  late Future<List<Product>?> products;

  @override
  void initState() {
    api = API();
    products = api.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.keyboard_backspace_sharp),
            ),
            Text(
              "TikTok shop",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_none_outlined),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, color: Colors.pinkAccent),
            Text(
              "Phần trưng bày",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.view_column_sharp)),
            IconButton(
              onPressed: () {
                setState(() {
                  products = api.getAllProducts();
                });
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
          ],
        ),
        FutureBuilder(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              if (snapshot.data == null) {
                return Center(child: Text("Lấy danh sách sản phẩm thất bại"));
              }
              return renderProductList(snapshot.data!);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }

  Widget renderProduct(Product product) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(product.getImage, width: 100, height: 150),
          ),
          Text(
            product.getTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            product.getPrice.toString() + ' \$',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent,
            ),
          ),
          IntrinsicWidth(
            child: Container(
              padding: EdgeInsets.only(left: 2, right: 2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 243, 242),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: const Color.fromARGB(255, 241, 193, 23),
                  ),
                  Text(product.getRating.getRate.toString()),
                ],
              ),
            ),
          ),

          Text(
            product.category,
            style: TextStyle(color: const Color.fromARGB(255, 4, 162, 183)),
          ),
        ],
      ),
    );
  }

  Widget renderProductList(List<Product> products) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 223, 218, 218),
        ),

        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.7,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) => renderProduct(products[index]),
        ),
      ),
    );
  }
}
