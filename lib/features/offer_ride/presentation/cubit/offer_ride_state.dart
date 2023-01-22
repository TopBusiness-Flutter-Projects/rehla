part of 'offer_ride_cubit.dart';

abstract class OfferRideState {}


class OfferRideInitial extends OfferRideState {}

class OfferRideGetAllCars extends OfferRideState {}
class OfferRideSelectLocation extends OfferRideState {}

class OfferRideIncrease extends OfferRideState {}
class OfferRideDecrease extends OfferRideState {}

class OfferRidePassengerChanged extends OfferRideState {}


