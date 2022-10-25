import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_alder_tech/features/auth/domain/entity/user_entity.dart';
import 'package:test_alder_tech/features/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase auth;
  AuthBloc({required this.auth}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginGuestEvent) {
        emit(LoadingAuthState());
        final failureOrSuccess = await auth();
        failureOrSuccess.fold((error) {
          emit(ErrorAuthState(message: error.toString()));
        }, (user) {
          emit(SuccessAuthState(user: user));
        });
      }
    });
  }
}
