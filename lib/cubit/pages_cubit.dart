import 'package:bloc/bloc.dart';

class PagesCubit extends Cubit<int> {
  PagesCubit() : super(0);

  void setPage(int newPage) {
    emit(newPage);
  }
}
