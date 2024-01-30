import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:streaming_data_dashboard/core/exceptions/api_exceptions.dart';
import 'package:streaming_data_dashboard/features/dashboard/repository/dashboard_repository.dart';
import 'package:streaming_data_dashboard/models/unit_model.dart';
import 'package:streaming_data_dashboard/service_locator.dart';

part 'units_edit_event.dart';
part 'units_edit_state.dart';

class UnitsEditBloc extends Bloc<UnitsEditEvent, UnitsEditState> {
  DashboardRepository _dashboardRepository = sl.get<DashboardRepository>();

  UnitsEditBloc() : super(UnitsEditInitial()) {
    on<UnitsEditEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchUnitDataEvent>(onFetchUnitDataEvent);
  }

  FutureOr<void> onFetchUnitDataEvent(
      FetchUnitDataEvent event, Emitter<UnitsEditState> emit) async {
    emit(UnitEditLoadingState());
    try {
      var data = await _dashboardRepository.getAllUnitsByPlant(event.plantName);
      emit(UnitEditLoadingSuccessState(units: data));
    } on ApiException catch (e) {
      emit(UnitEditLoadingFailedState(apiException: e));
    }
  }
}
