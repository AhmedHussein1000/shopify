import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/home_model/home_data_model.dart';
import '../../repository/base_home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final BaseHomeRepo baseHomeRepo;
  HomeCubit(this.baseHomeRepo) : super(HomeInitial());
  void getHomeData() async {
    emit(HomeLoading());
    var result = await baseHomeRepo.getHomeData();
    result.fold((failure) => emit(HomeFailure(message: failure.message)),
        (homeData) => emit(HomeSuccess(homeData: homeData)));
  }
}
