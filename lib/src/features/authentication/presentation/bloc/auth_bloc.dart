import 'package:bloc/bloc.dart';
import 'package:match_me/src/features/authentication/data/data_user_account_local.dart';
import 'package:match_me/src/features/authentication/domain/user_account.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<RegisterAuthEvent>((event, emit) async {
      emit(AuthLoading());
      DataUserAccountLocal.setDataUserAccountToStorage(event.userAccount);
      UserAccountRegister.setUserAccountRegisterToStorage(event.isRegister);
      await Future.delayed(const Duration(milliseconds: 2));
      emit(AuthSuccess(
          userAccount: event.userAccount, isRegister: event.isRegister));
    });
  }
}
