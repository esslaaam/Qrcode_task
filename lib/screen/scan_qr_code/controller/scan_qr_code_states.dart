abstract class CustomScanQrCodeStates {}

class CustomScanQrCodeInitialState extends CustomScanQrCodeStates {}
class InitScan extends CustomScanQrCodeStates {}
class ResultScan extends CustomScanQrCodeStates {}
class DoneScan extends CustomScanQrCodeStates {}
class ScanningLoadingState extends CustomScanQrCodeStates {}
class ScanningFailureState extends CustomScanQrCodeStates {}
class ScanningSuccessState extends CustomScanQrCodeStates {}