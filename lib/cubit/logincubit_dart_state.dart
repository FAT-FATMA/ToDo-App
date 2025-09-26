part of 'logincubit_dart_cubit.dart';

abstract class StatesLogin {}

class StatesLoginInitial extends StatesLogin {}

class StatesLoginLoading extends StatesLogin {}

class StatesLoginSuccess extends StatesLogin {
  final TodoModel loginModel;

  StatesLoginSuccess(this.loginModel);
}

class StatesLoginError extends StatesLogin {
  final String error;

  StatesLoginError(this.error);
}

class StatesGatData extends StatesLogin {
  final TodoModel listModel;

  //StatesGatData(this.loginModel);
  StatesGatData(this.listModel);
  // StatesGatData(this.loginModel);
}

final class StateAdTaskSuccess extends StatesLogin {
  final TodoModel editModel;
  StateAdTaskSuccess(this.editModel);
}

final class EditTaskSuccess extends StatesLogin {
  final TodoModel editModel;

  EditTaskSuccess(this.editModel);
}

final class DeleteTaskSuccess extends StatesLogin {
  final TodoModel deleteModel;
  DeleteTaskSuccess(this.deleteModel);
}

final class StatesProfileData extends StatesLogin {
  final TodoModel profileModel;

  StatesProfileData(this.profileModel);
}

final class GetPorfileDataSuccessState extends StatesLogin {}

final class GetPorfileDataErrorState extends StatesLogin {}