import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/about_us_data_model.dart';
import '../../repository/base_about_us_repo.dart';

part 'about_us_state.dart';

class AboutUsCubit extends Cubit<AboutUsState> {
  AboutUsCubit(this.baseAboutUsRepo) : super(AboutUsInitial());
  final BaseAboutUsRepo baseAboutUsRepo;
  Future<void> getAboutUsAndTerms() async {
    emit(AboutUsLoading());
    final result = await baseAboutUsRepo.getAboutUsAndTerms();
    result.fold((failure) => emit(AboutUsFailure(failure.message)),
        (aboutUsResponse) => emit(AboutUsSuccess(aboutUsResponse.data!)));
  }
}
