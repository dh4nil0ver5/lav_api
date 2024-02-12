class SalesModel {
  final String status; 
  List<Sales> data;
  
  SalesModel({this.status = "no-status", this.data = const []});

  factory SalesModel.fromJson(Map<String, dynamic> json){
    return SalesModel(
        status: json["status"],
        data: List<Sales>.from(json["data"]["data"]["detail"].map((e) => Sales.fromJson(e))),
      );
  }
}

 

class Sales {
  int id;
  final String brand;
  final int volume;
  final int profit; 
  Sales({required this.id, required this.brand, required this.volume, required this.profit});
  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales( 
      id: json["id"], 
      brand: json["brand"], 
      volume: int.parse(json["volume"]), 
      profit: int.parse(json["profit"]) );
  }
} 
