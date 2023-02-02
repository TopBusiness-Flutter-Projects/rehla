import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  String imagePath = '';
  XFile? imageFile;

  pickImage({required String type, required int item}) async {
    imageFile = await ImagePicker().pickImage(
      source: type == 'camera' ? ImageSource.camera : ImageSource.gallery,
    );
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
      sourcePath: imageFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9
      ],
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 90,
    );
    imagePath = croppedFile!.path;
    emit(DetailsPickImageSuccess());
  }
}
