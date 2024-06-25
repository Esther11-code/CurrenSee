part of 'currency_cubit.dart';

@immutable
sealed class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final List<Country>? countries;

  CurrencyLoaded(this.countries);
}

final class CurrencyError extends CurrencyState {}
