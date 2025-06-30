import 'package:bloc/bloc.dart';
import 'package:finalproject_nti/feature/lab_home/cubit/lap_state.dart';
import 'package:finalproject_nti/feature/lab_home/model/lab_data.dart';

class LapCubit extends Cubit<LapState>{
  LapCubit():super(LapInitialState());
  LabData labData = LabData();

  fetchLabDataCubie() async{
    emit(LapLoadingState());
    var data = await labData.fetchLabData();
    // print('dddddddddddddddddddddddd${data['product'].runtimeType}');
    emit(LapSuccessState(labs: data['product']));
  }
}