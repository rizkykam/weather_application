part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class ConnectedEvent extends ConnectivityEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NotConnectedEvent extends ConnectivityEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
