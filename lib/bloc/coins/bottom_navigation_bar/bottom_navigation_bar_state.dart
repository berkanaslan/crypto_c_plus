part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState extends Equatable {
  const BottomNavigationBarState();
}

class BottomNavigationBarInitial extends BottomNavigationBarState {
  @override
  List<Object> get props => [];
}

class BottomNavigationBarLoadingState extends BottomNavigationBarState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class BottomNavigationBarLoadedState extends BottomNavigationBarState {
  Widget floatingActionButton;
  FloatingActionButtonLocation floatingActionButtonLocation;
  Widget bottomNavigationBar;


  BottomNavigationBarLoadedState({@required  this.floatingActionButton, this.floatingActionButtonLocation, this.bottomNavigationBar});

  @override
  List<Object> get props => [floatingActionButton, floatingActionButtonLocation, floatingActionButton];
}

class BottomNavigationBarErrorState extends BottomNavigationBarState {
  @override
  List<Object> get props => throw UnimplementedError();
}
