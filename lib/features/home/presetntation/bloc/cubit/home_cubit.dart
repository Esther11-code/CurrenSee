import 'package:bloc/bloc.dart';
import 'package:currencsee/features/currency/data/models/currency_model.dart';
import 'package:currencsee/features/home/data/local/home_static_repo.dart';
import 'package:meta/meta.dart';
import '../../pages/home.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List bottomnavScreen = [
    HomePage(
      country: Country(
        flag: 'http://img.geonames.org/flags/x/yt.gif',
        countryName: 'Mayotte',
        currency: 'Euro Member Countries',
        code: 'EUR',
        symbol: '\u20AC',
        symbolImage:
            'https://www.xe.com/symbols-page/symbols/curSymbol8364.gif',
      ),
    )
  ];
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
