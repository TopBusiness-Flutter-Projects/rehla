class OfferRideModel {
  final String? startLocation;
  final String? endLocation;
  final String? startTime;
  final String? endTime;
  final String? date;
  final int? expectedDistance;
  final int? expectedPrice;
  final int? totalSeatPrice;
  final int? numberOfSeats;
  final String? selectedCar;
  final bool? isPassenger;
  final String? information;
  final String? driverName;
  final String? passengerName;
  int? status;
  DriverModel? driverModel;
  List<PassengerModel>? passengerModel;

  OfferRideModel({
    this.passengerModel,
    this.driverModel,
    this.startLocation,
    this.endLocation,
    this.startTime,
    this.endTime,
    this.date,
    this.expectedDistance,
    this.expectedPrice,
    this.totalSeatPrice,
    this.numberOfSeats,
    this.selectedCar,
    this.isPassenger,
    this.information,
    this.driverName,
    this.passengerName,
    this.status = 0,
  });

  factory OfferRideModel.fromJson(Map<String, dynamic> json) => OfferRideModel(
        startLocation: json["startLocation"],
        endLocation: json["endLocation"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        date: json["date"],
        expectedDistance: json["expectedDistance"],
        expectedPrice: json["expectedPrice"],
        totalSeatPrice: json["totalSeatPrice"],
        numberOfSeats: json["numberOfSeats"],
        selectedCar: json["selectedCar"],
        isPassenger: json["isPassenger"],
        information: json["information"],
        driverName: json["driverName"],
        passengerName: json["passengerName"],
        status: json["status"],
        driverModel: json["driverModel"] != null
            ? DriverModel.fromJson(json["driverModel"])
            : null,
        passengerModel: json["passengerModel"]!=null
            ? List<PassengerModel>.from(
                json["passengerModel"].map((x) => PassengerModel.fromJson(x),
                ),
              )
            : null,
      );

  Map<String, dynamic> toJson() => {
        "startLocation": startLocation,
        "endLocation": endLocation,
        "startTime": startTime,
        "endTime": endTime,
        "date": date,
        "expectedDistance": expectedDistance,
        "expectedPrice": expectedPrice,
        "totalSeatPrice": totalSeatPrice,
        "numberOfSeats": numberOfSeats,
        "selectedCar": selectedCar,
        "isPassenger": isPassenger,
        "information": information,
        "driverName": driverName,
        "passengerName": passengerName,
        "status": status,
        "driverModel": driverModel != null ? driverModel!.toJson() : null,
        "passengerModel": passengerModel!=null
            ? List<dynamic>.from(
                passengerModel!.map(
                  (x) => x.toJson(),
                ),
              ).toList()
            : null,
      };
}

class DriverModel {
  final String? diverName;
  final String? diverImagePath;

  DriverModel({this.diverName, this.diverImagePath});

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        diverName: json["diverName"],
        diverImagePath: json["diverImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "diverName": diverName,
        "diverImagePath": diverImagePath,
      };
}

class PassengerModel {
  final String? passengerName;
  final String? passengerImagePath;

  PassengerModel({this.passengerName, this.passengerImagePath});

  factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        passengerName: json["passengerName"],
        passengerImagePath: json["passengerImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "passengerName": passengerName,
        "passengerImagePath": passengerImagePath,
      };
}
