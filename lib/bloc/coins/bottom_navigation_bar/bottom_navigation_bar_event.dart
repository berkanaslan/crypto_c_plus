part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent extends Equatable {
  const BottomNavigationBarEvent();
}

class GetBottomNavigationBar extends BottomNavigationBarEvent {
  @override
  List<Object> get props => [];
}
