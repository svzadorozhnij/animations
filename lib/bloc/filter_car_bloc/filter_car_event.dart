part of 'filter_car_bloc.dart';

abstract class FilterCarEvent extends Equatable {
  const FilterCarEvent();

  @override
  List<Object> get props => [];
}

class SetNewCarEvent extends FilterCarEvent {
  final CarModel car;
  const SetNewCarEvent(this.car);

  @override
  List<Object> get props => [car];
}