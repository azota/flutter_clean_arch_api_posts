import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/models/ecommerce_model.dart';
import '../../../domain/use_cases/get_ecommerce_usecase.dart';

part 'ecommerce_event.dart';
part 'ecommerce_state.dart';

class EcommerceBloc extends Bloc<EcommerceEvent, EcommerceState> {
  final GetEcommerceUseCase _getEcommerceUseCase;

  EcommerceBloc(this._getEcommerceUseCase) : super(EcommerceInitial()) {
    on<EcommerceEvent>((event, emit) {
      on<GetEcommerceList>(_getEcommerceList);
    });
  }

  Future<FutureOr<void>> _getEcommerceList(
    event,
    Emitter<EcommerceState> emit,
  ) async {
    final response = await _getEcommerceUseCase();

    response.when(
      success: (items) {
        emit(EcommerceLoaded(items));
      },
      error: (e, message) {
        emit(const EcommerceError('response.error'));
      },
    );
  }
}
