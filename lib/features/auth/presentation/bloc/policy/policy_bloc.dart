import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_alder_tech/features/auth/domain/usecase/get_policy_usecase.dart';

part 'policy_event.dart';
part 'policy_state.dart';

class PolicyBloc extends Bloc<PolicyEvent, PolicyState> {
  final GetPolicyUseCase getPolicy;
  PolicyBloc({required this.getPolicy}) : super(PolicyInitial()) {
    on<PolicyEvent>((event, emit) async {
      if (event is GetPolicyEvent) {
        emit(LoadingPolicyState());
        final failureOrpolicy = await getPolicy();
        failureOrpolicy.fold((error) {
          emit(ErrorPolicyState(message: error.toString()));
        }, (policy) {
          emit(LoadedPolicyState(policy: policy));
        });
      }
    });
  }
}
