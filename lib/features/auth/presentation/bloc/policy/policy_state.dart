part of 'policy_bloc.dart';

abstract class PolicyState extends Equatable {
  const PolicyState();

  @override
  List<Object> get props => [];
}

class PolicyInitial extends PolicyState {}

class LoadingPolicyState extends PolicyState {}

class LoadedPolicyState extends PolicyState {
  final String policy;

  const LoadedPolicyState({required this.policy});
}

class ErrorPolicyState extends PolicyState {
  final String message;

  const ErrorPolicyState({required this.message});
}
