import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/Features/auth/data/repo/signup_repo.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.repo}) : super(SignupInitial());

  final SignupRepo repo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();

  bool addCar = false;
  CountryModel? selectedCountry;
  LocationModel? selectedLocation;
  String? birthDate;

  void selectCountry(CountryModel country) {
    selectedCountry = country;
    countryController.text = country.country;
  }

  void selectLocation(LocationModel location) {
    selectedLocation = location;
    locationController.text = location.name;
  }

  void selectBirthDate(String date) {
    birthDate = date;
    birthDateController.text = date;
  }

  void setAddCar(bool value) {
    addCar = value;
    emit(SignupToggleCar(addCar: addCar));
  }

  void signup() async {
    if (!formKey.currentState!.validate()) {
      emit(SignupValidationFailed());
      return;
    }

    if (selectedCountry == null || selectedLocation == null) {
      emit(
        SignupFailure(
          error: ErrorModel(
            message: 'Please select location and country',
           
          ),
        ),
      );
      return;
    }

    emit(SignupLoading());
    final result = await repo.signUp(
      signupRequestModel: SignupRequestModel(
        fullName:
            '${firstNameController.text.trim()} ${lastNameController.text.trim()}',
        email: emailController.text.trim(),
        phone: phoneController.text.trim(),
        countryId: selectedCountry!.id.toString(),
        locationId: selectedLocation!.id.toString(),
        password: passwordController.text.trim(),
        availableToAddCar: addCar ? '1' : '0',
        birthDate: birthDate,
        nationalId: nationalIdController.text.trim(),
      ),
    );

    result.when(
      onSuccess: (data) async {
        LocalSecureStorageHelper().saveTokens(
          access: data.tokens.access,
          refresh: data.tokens.refresh,
        );
        final verifyResult = await repo.verifyPhone(
          phone: phoneController.text.trim(),
        );
        verifyResult.when(
          onSuccess: (data) {
            LocalSecureStorageHelper().write(
              key: SecureStorageKeys.verifyToken,
              value: data.verifyToken,
            );
            emit(
              SignUpSuccessAndPhoneVerifyCodeSent(
                verifyPhoneResponseModel: data,
              ),
            );
          },
          onError: (error) {
            emit(SignupFailure(error: error));
          },
        );
      },
      onError: (e) => emit(SignupFailure(error: e)),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    locationController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    birthDateController.dispose();
    nationalIdController.dispose();
    return super.close();
  }
}
