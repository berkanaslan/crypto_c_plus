import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_c_plus/widgets/bottom_navigation_bar.dart';
import 'package:crypto_c_plus/widgets/floating_action_button.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_event.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial());

  @override
  Stream<BottomNavigationBarState> mapEventToState(
      BottomNavigationBarEvent event) async* {
    if (event is GetBottomNavigationBar) {
      yield BottomNavigationBarLoadingState();
      try {
        yield BottomNavigationBarLoadedState(
          floatingActionButton: FloatingActionButtonWidget(),
          bottomNavigationBar: BottomNavigationBarWidget(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        );
      } catch (e) {
        yield BottomNavigationBarErrorState();
      }
    }
  }
}
