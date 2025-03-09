class FlighModel {
  var id;
  var flignt_name;
  var arrival;
  var Destination;
  var Price;
  var Time;
  var flight_no;

  FlighModel({this.id,this.flignt_name,this.arrival,this.Destination,this.Price,this.Time,this.flight_no});

  factory FlighModel.fromJson(Map<String, dynamic> json){
    return FlighModel(
      id: json['id']?? "",
      flignt_name: json['flignt_name']?? "",
      arrival: json['arrival']?? "",
      Destination: json['Destination']?? "",
      Price: json['Price']?? "",
      Time: json['Time']?? "",
      flight_no: json['flight_no']?? "",
    );
  }
}