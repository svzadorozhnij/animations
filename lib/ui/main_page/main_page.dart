import 'package:animations/bloc/filter_car_bloc/filter_car_bloc.dart';
import 'package:animations/ui/auto_filter_mixin.dart';
import 'package:animations/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutoFilterMixin, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [autoFilterButton()],
      ),
      body: Stack(
        children: [_body(), autoFilterMenu()],
      ),
    );
  }

  Widget _body() {
    return BlocBuilder<FilterCarBloc, FilterCarState>(
        builder: (context, state) {
      String? car = state is FilterDataState ? state.car?.plateNumber : null;

      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              width: MediaQuery.sizeOf(context).width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: Image.network(
                      'https://car-images.bauersecure.com/wp-images/2697/bmwi4_029.jpg',
                    ).image,
                    fit: BoxFit.fill,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              car ?? 'Select Car',
              style: context.textStyles.headlineLarge,
            ),
          ],
        ),
      );
    });
  }
}
