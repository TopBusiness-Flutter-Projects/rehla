class AddCarModel {
  final String? carPhoto;
  final String? carBrandContent;
  final String? carModelContent;
  final String? carTypeContent;
  final String? carColorContent;
  final String? productionYearContent;
  final String? carSeatContent;
  final String? carPlateTextContent;
  final String? sequenceNumber;
  final String? drivingLicencePhoto;
  final String? carInsurancePhoto;
  final String? carPaper;

  AddCarModel({
     this.carPhoto,
     this.carBrandContent,
     this.carModelContent,
     this.carTypeContent,
     this.carColorContent,
     this.productionYearContent,
     this.carSeatContent,
     this.carPlateTextContent,
     this.sequenceNumber,
     this.drivingLicencePhoto,
     this.carInsurancePhoto,
     this.carPaper,
  });

  factory AddCarModel.fromJson(Map<String, dynamic> json) => AddCarModel(
        carPhoto: json["CarPhoto"],
        carBrandContent: json["carBrandContent"],
        carModelContent: json["carModelContent"],
        carTypeContent: json["carTypeContent"],
        carColorContent: json["carColorContent"],
        productionYearContent: json["productionYearContent"],
        carSeatContent: json["carSeatContent"],
        carPlateTextContent: json["carPlateTextContent"],
        sequenceNumber: json["sequenceNumber"],
        drivingLicencePhoto: json["drivingLicencePhoto"],
        carInsurancePhoto: json["carInsurancePhoto"],
        carPaper: json["carPaper"],
      );

  Map<String, dynamic> toJson() => {
        "CarPhoto": carPhoto,
        "carBrandContent": carBrandContent,
        "carModelContent": carModelContent,
        "carTypeContent": carTypeContent,
        "carColorContent": carColorContent,
        "productionYearContent": productionYearContent,
        "carSeatContent": carSeatContent,
        "carPlateTextContent": carPlateTextContent,
        "sequenceNumber": sequenceNumber,
        "drivingLicencePhoto": drivingLicencePhoto,
        "carInsurancePhoto": carInsurancePhoto,
        "carPaper": carPaper,
      };
}
