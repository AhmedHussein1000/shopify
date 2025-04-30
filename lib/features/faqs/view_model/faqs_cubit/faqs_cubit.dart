import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/faqs_model.dart';
import '../../repository/base_faqs_repo.dart';

part 'faqs_state.dart';

class FAQsCubit extends Cubit<FAQsState> {
  FAQsCubit(this.baseFAQsRepo) : super(FAQsInitial());
  final BaseFAQsRepo baseFAQsRepo;
  Future<void> getFAQs() async {
    emit(FAQsLoading());
    var result = await baseFAQsRepo.getFAQs();
    result.fold((failure) {
      emit(FAQsFailure(message: failure.message));
    }, (faqsModel) {
      emit(FAQsSuccess(faqsModel: faqsModel));
    });
  }
}
