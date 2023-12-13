import 'dart:ui';

import 'package:animations/bloc/filter_car_bloc/filter_car_bloc.dart';
import 'package:animations/ui/global_widgets/filter_button_style.dart';
import 'package:animations/utils/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AutoFilterMixin<T extends StatefulWidget> on State<T>
    implements TickerProvider {
  final curve = Curves.ease;

  final Duration durationAnimation = const Duration(seconds: 1);

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: durationAnimation,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: curve,
  );

  late Animation<RelativeRect> transition = RelativeRectTween(
    begin: RelativeRect.fromSize(
      Rect.fromLTWH(MediaQuery.sizeOf(context).width, 0,
          MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
      Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
    ),
    end: RelativeRect.fromSize(
      Rect.fromLTWH(0, 0, MediaQuery.sizeOf(context).width,
          MediaQuery.sizeOf(context).height),
      Size(MediaQuery.sizeOf(context).width, MediaQuery.sizeOf(context).height),
    ),
  ).animate(
    CurvedAnimation(
      parent: _controller,
      curve: curve,
    ),
  );

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void onSelectCar() {
    if (_controller.status == AnimationStatus.completed) {
      _controller.animateBack(0);
    } else {
      _controller.forward();
    }
  }

  Widget autoFilterButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: FilterButtonStyle(
        onTap: onSelectCar,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<FilterCarBloc, FilterCarState>(
                builder: (context, state) {
              final selectCar = state is FilterDataState
                  ? state.car?.plateNumber ?? 'All Cars'
                  : 'All Cars';
              return AnimatedCrossFade(
                firstChild: Text(
                  selectCar,
                  style: context.textStyles.bodyLarge,
                ),
                secondChild: const SizedBox(),
                crossFadeState: CrossFadeState.showFirst,
                duration: durationAnimation,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget autoFilterMenu() {
    if (_controller.isDismissed) {
      return const SizedBox();
    }
    return Stack(
      alignment: Alignment.topRight,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: _controller.value * 5,
            sigmaY: _controller.value * 5,
          ),
          child: const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: ColoredBox(
              color: Colors.transparent,
            ),
          ),
        ),
        PositionedTransition(
          rect: transition,
          child: FadeTransition(
            opacity: _animation,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 3),
              child: BlocBuilder<FilterCarBloc, FilterCarState>(
                  builder: (context, state) {
                if (state is FilterDataState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: WrapAlignment.end,
                        children: List.generate(
                          state.carList.length,
                          (index) => FilterButtonStyle(
                            onTap: () {
                              context
                                  .read<FilterCarBloc>()
                                  .add(SetNewCarEvent(state.carList[index]));
                              onSelectCar();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  state.carList[index].plateNumber,
                                  style: context.textStyles.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
          ),
        ),
      ],
    );
  }
}
