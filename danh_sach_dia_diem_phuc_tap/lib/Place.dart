class Place {
  String name;
  String imgUrl;
  double rateScore;
  int rateCount;
  String location;
  double price; // US$
  String priceDes;

  Place(
    this.name,
    this.imgUrl,
    this.rateScore,
    this.rateCount,
    this.location,
    this.price,
    this.priceDes,
  );

  String get getName => name;
  String get getImgUrl => imgUrl;
  double get getRateScore => rateScore;
  int get getRateCount => rateCount;
  String get getLocation => location;
  double get getPrice => price;
  String get getPriceDes => priceDes;
}
