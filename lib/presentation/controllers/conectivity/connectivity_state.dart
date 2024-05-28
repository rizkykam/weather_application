part of 'connectivity_bloc.dart';


abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class ConnectedState extends ConnectivityState {
  final String message;

  const ConnectedState({required this.message});

  @override
  List<Object?> get props => [message];
}

class NotConnectedState extends ConnectivityState {
  final String message;

  const NotConnectedState({required this.message});

  @override
  List<Object?> get props => [message];
}
