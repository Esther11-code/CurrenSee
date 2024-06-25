import 'package:bloc/bloc.dart';
import 'package:currencsee/features/home/data/local/home_static_repo.dart';
import 'package:meta/meta.dart';
import '../../pages/home.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List bottomnavScreen = const [HomePage()];
  int bottonnavIndex = 0;

  changeBottomNav(value) {
    emit(HomeLoading());
    bottonnavIndex = value;
    emit(HomeILoaded());
  }

  String selectedTab = HomestaticRepo.selectedTab[1];
  changeTab(dynamic value) {
    emit(HomeLoading());
    selectedTab = value;
    emit(HomeILoaded());
  }
}
