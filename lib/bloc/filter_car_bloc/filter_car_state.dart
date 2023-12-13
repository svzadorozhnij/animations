part of 'filter_car_bloc.dart';

abstract class FilterCarState extends Equatable {
  const FilterCarState();

  @override
  List<Object?> get props => [];
}

class FilterDataState extends FilterCarState {
  final List<CarModel> carList;
  final CarModel? car;

  const FilterDataState({required this.carList, required this.car});

  @override
  List<Object?> get props => [carList, car];
}

class InitFilterState extends FilterCarState {}
