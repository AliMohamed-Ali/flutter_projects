import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubites/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class CubitWeather extends Cubit<WeatherState> {
  CubitWeather(this.weatherServices) : super(WeatherInitial());
  WeatherServices weatherServices;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await weatherServices.getWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel: weatherModel!));
    } on Exception catch (e) {
      emit(WeatherFailureState());
    }
  }
}
