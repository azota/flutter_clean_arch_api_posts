part of 'ecommerce_bloc.dart';

abstract class EcommerceEvent extends Equatable {
  const EcommerceEvent();

  @override
  List<Object> get props => [];
}

class GetEcommerceList extends EcommerceEvent {
  const GetEcommerceList();
}
