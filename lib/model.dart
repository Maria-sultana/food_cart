class Product{
  String? name;
  String? price;
  String? deliverycharge;
  String? totalprice;
  String? distance;
  String? rating;
  Product( this.price,this.rating,this.deliverycharge,this.distance,this.totalprice);

  static generatedList() {
    Product("Burger","500", "rating⭐", "80tk.", "150 m.", );
    Product("Burger","500", "rating⭐", "80tk.", "150 m.", );
    Product("Burger","500", "rating⭐", "80tk.", "150 m.");
    Product("Burger","500", "rating⭐", "80tk.", "150 m.", );
    Product("Burger","500", "rating⭐", "80tk.", "150 m.", );
    Product("Burger","500", "rating⭐", "80tk.", "150 m.", );
  }
}
