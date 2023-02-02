import 'offer_ride_model.dart';

class OfferRideListModel {
  late final List<OfferRideModel>? offerRide;
  late final List<OfferRideModel>? lastOfferRide;

  OfferRideListModel({this.offerRide, this.lastOfferRide});

  factory OfferRideListModel.fromJson(Map<String, dynamic> json) =>
      OfferRideListModel(
        offerRide: List<OfferRideModel>.from(
          json["offerRide"].map((x) => OfferRideModel.fromJson(x)),
        ),
       lastOfferRide: json["lastOfferRide"]!=null? List<OfferRideModel>.from(
          json["lastOfferRide"].map((x) => OfferRideModel.fromJson(x)),
        ):[],
      );

  Map<String, dynamic> toJson() => {
        "offerRide": List<OfferRideModel>.from(offerRide!.map((x) => x)),

        "lastOfferRide": List<OfferRideModel>.from(lastOfferRide!.map((x) => x)),
      };
  Map<String, dynamic> deleteOfferToJson() => {
    "offerRide": List<OfferRideModel>.from(offerRide!.map((x) => x)),
  };
}
