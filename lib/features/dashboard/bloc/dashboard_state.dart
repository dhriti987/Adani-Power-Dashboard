part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

sealed class DashboardActionState extends DashboardState {}

final class DashboardInitial extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class DashboardLoadingFailedState extends DashboardState {
  final ApiException apiException;

  DashboardLoadingFailedState({required this.apiException});
}

class DashboardLoadingSuccessState extends DashboardState {
  final List<Unit> units;

  DashboardLoadingSuccessState({required this.units});
}
