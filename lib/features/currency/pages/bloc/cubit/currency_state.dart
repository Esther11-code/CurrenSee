part of 'currency_cubit.dart';

@immutable
sealed class CurrencyState {}

final class CurrencyInitial extends CurrencyState {}

final class CurrencyLoading extends CurrencyState {}

final class CurrencyLoaded extends CurrencyState {
  final List<Country>? countries;

  CurrencyLoaded(this.countries);

   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyLoaded &&
          runtimeType == other.runtimeType &&
          countries == other.countries;

  @override
  int get hashCode => countries.hashCode;
}

final class CurrencyError extends CurrencyState {}
