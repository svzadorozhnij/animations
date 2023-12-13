import 'dart:async';

import 'package:animations/models/car_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_car_event.dart';

part 'filter_car_state.dart';

final carList = [
  CarModel(plateNumber: 'Volvo'),
  CarModel(plateNumber: 'BMW'),
  CarModel(plateNumber: 'AUDY'),
  CarModel(plateNumber: 'LEXUS'),
  CarModel(plateNumber: 'LEXUS2'),
  CarModel(plateNumber: 'LEXUS3'),
];

class FilterCarBloc extends Bloc<FilterCarEvent, FilterCarState> {
  FilterCarBloc()
      : super(
          FilterDataState(
            carList: carList,
            car: CarModel(plateNumber: 'Volvo'),
          ),
        ) {
    on<SetNewCarEvent>(_setNewCar);
  }

  late CarModel _selectCar = _cars.first;
  late final _cars = carList;

  FutureOr<void> _setNewCar(
      SetNewCarEvent event, Emitter<FilterCarState> emit) {
    _selectCar = event.car;
    emit(FilterDataState(carList: _cars, car: _selectCar));
  }
}
