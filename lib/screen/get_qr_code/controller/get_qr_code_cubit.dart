import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_pyramides/componants/toast.dart';
import 'package:task_pyramides/core/local/global_config.dart';
import 'package:task_pyramides/screen/get_qr_code/controller/get_qr_code_states.dart';
import 'package:task_pyramides/screen/get_qr_code/model/my_scan_model.dart';
import 'package:task_pyramides/shared/local/cache_helper.dart';

class GetQrCodeCubit extends Cubit<GetQrCodeStates> {
  GetQrCodeCubit() : super(GetQrCodeInitialState());

  static GetQrCodeCubit get(context) => BlocProvider.of(context);

  MyScanModel? myScanModel;

  Future<void> getScanning(context) async {
    print('>>>>>>>>>>>>>> Loading Scan data >>>>>>>>>');
    emit(GetQrCodeLoadingState());
    try {
      Response? response;
      response = await Dio().get(
        AllAppApiConfig.baseUrl + AllAppApiConfig.getScan,
        options: Options(
            method: "get",
            validateStatus: (state) => state! <= 500,
            headers: {
              "Accept": "application/json",
              "Authorization":"Bearer ${CacheHelper.getData(key: "token")}",
            }),
      );
      if (response.data["status"] == 0) {
        print('>>>>>>>>>>>>>>  Error Scanning data >>>>>>>>>');
        emit(GetQrCodeFailureState());
      } else {
        myScanModel = MyScanModel.fromJson(response.data);
        // showToast(text: response.data['massage'], state: ToastStates.success);
        print('>>>>>>>>>>>>>> getting Scanning data >>>>>>>>>');
        emit(GetQrCodeSuccessState());
      }
    } catch (e, s) {
      print(e);
      print(s);
    }

    print('>>>>>>>>>>>>>> finishing Scanning data >>>>>>>>>');
  }
}
