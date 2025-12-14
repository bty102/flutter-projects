import 'package:danh_sach_dia_diem_phuc_tap/Place.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }
}

Widget myBody() {
  return ListView(
    scrollDirection: Axis.vertical,
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: const Color.fromARGB(255, 209, 206, 206),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
                Text("Sắp xếp"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_sharp),
                ),
                Text("Lọc"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.map_outlined)),
                Text("Bản đồ"),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10, bottom: 15),
        child: Text("757 chỗ nghỉ"),
      ),
      buildPlaces(getPlaces()),
    ],
  );
}

List<Place> getPlaces() {
  List<Place> places = [];
  places.add(
    Place(
      "aNhill Boutique",
      "https://cf.bstatic.com/xdata/images/hotel/max1024x768/606510571.jpg?k=728b23fdc60e1b2b5c588d2f93c8b7ecb8e41cf92b7ccf906da0a6ea917ec353&o=",
      9.0,
      90,
      "Huế",
      100,
      "Đã bao gồm thuế và phí",
    ),
  );

  places.add(
    Place(
      "An Name Hue Boutique",
      "https://upload.wikimedia.org/wikipedia/commons/6/62/T%C6%B0%E1%BB%A3ng_%C4%91%C3%A0i_Kh%C3%A1t_v%E1%BB%8Dng_th%E1%BB%91ng_nh%E1%BA%A5t_non_s%C3%B4ng.JPG",
      9.5,
      80,
      "Cư Chinh",
      50,
      "Đã bao gồm thuế và phí",
    ),
  );

  places.add(
    Place(
      "Huế Jade Hill Villa",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3O58z8kHfxp-LhCt72BNzl2qeuI1TyONkaw&s",
      8.8,
      200,
      "Cư Chinh",
      300,
      "Đã bao gồm thuế và phí",
    ),
  );

  places.add(
    Place(
      "Cầu tràng tiền",
      "https://upload.wikimedia.org/wikipedia/commons/0/0e/Hue%2C_le_pont_Trang_Tien.jpg",
      10.0,
      500,
      "Huế",
      300,
      "Đã bao gồm thuế và phí",
    ),
  );
  return places;
}

Widget buildPlace(Place place) {
  return Container(
    padding: EdgeInsets.only(bottom: 10),
    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey)),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          child: SizedBox(
            width: 120,
            height: 150,
            child: Image.network(place.getImgUrl, fit: BoxFit.fill),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.getName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              place.getRateScore.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.circle, size: 5),
                          SizedBox(width: 5),
                          Text(
                            place.getRateCount.toString() + " đánh giá",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 101, 98, 98),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text(place.getLocation),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.heart_broken_outlined),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "US\$" + place.getPrice.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      place.getPriceDes,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 101, 98, 98),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildPlaces(List<Place> places) {
  List<Widget> builtPlaces = [];
  for (var place in places) {
    builtPlaces.add(buildPlace(place));
  }
  return Column(children: builtPlaces);
}
