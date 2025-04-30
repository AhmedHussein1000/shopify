import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/categories_model/category_model.dart';
import '../../repository/base_categories_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.baseCategoriesRepo) : super(CategoriesInitial());
  final BaseCategoriesRepo baseCategoriesRepo;
  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final result = await baseCategoriesRepo.getCategories();
    result.fold((failure) {
      emit(CategoriesFailure(message: failure.message));
    }, (categories) {
      emit(CategoriesSuccess(categories: categories));
    });
  }
}
