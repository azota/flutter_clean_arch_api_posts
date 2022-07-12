part of 'ecommerce_bloc.dart';

abstract class EcommerceState extends Equatable {
  final List<EcommerceModel>? items;
  final String? error;

  const EcommerceState({this.items, this.error});

  @override
  List<Object> get props => [];
}

class EcommerceInitial extends EcommerceState {}

class EcommerceLoaded extends EcommerceState {
  const EcommerceLoaded(List<EcommerceModel> items) : super(items: items);
}

class EcommerceError extends EcommerceState {
  const EcommerceError(String error) : super(error: error);
}
