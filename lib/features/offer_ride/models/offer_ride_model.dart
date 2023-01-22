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

  OfferRideModel({
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
      };
}
