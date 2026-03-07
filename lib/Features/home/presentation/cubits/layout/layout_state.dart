part of 'layout_cubit.dart';

sealed class LayoutState extends Equatable {
  const LayoutState({required this.index});
  final int index;
  @override
  List<Object> get props => [index];
}

final class LayoutInitial extends LayoutState {
  const LayoutInitial() : super(index: 0);
}

final class LayoutChanged extends LayoutState {
  const LayoutChanged(int index) : super(index: index);
}
