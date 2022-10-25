part of 'policy_bloc.dart';

abstract class PolicyEvent extends Equatable {
  const PolicyEvent();

  @override
  List<Object> get props => [];
}

class GetPolicyEvent extends PolicyEvent {}
