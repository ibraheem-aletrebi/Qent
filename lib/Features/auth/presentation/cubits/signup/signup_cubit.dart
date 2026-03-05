import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/data/models/signup_request_model.dart';
import 'package:quent/Features/auth/data/models/verify_phone_response_model.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/services/local/local_secure_storage_helper.dart';
import 'package:quent/core/services/remote/models/error_model.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.authRepo}) : super(SignupInitial());

  final AuthRepo authRepo;

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

  Future<void> signup() async {
    if (!formKey.currentState!.validate()) {
      emit(SignupValidationFailed());
      return;
    }

    if (selectedCountry == null || selectedLocation == null) {
      emit(
        SignupFailure(
          error: ErrorModel(message: 'Please select location and country'),
        ),
      );
      return;
    }

    emit(SignupLoading());

    final signupResult = await authRepo.signUp(
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

    signupResult.when(
      onSuccess: (response) async {
        await LocalSecureStorageHelper().saveTokens(
          access: response.tokens.access,
          refresh: response.tokens.refresh,
        );

        final verifyResult = await authRepo.verifyPhone(
          phone: phoneController.text.trim(),
        );

        verifyResult.when(
          onSuccess: (VerifyPhoneResponseModel verifyResponse) async {
            await LocalSecureStorageHelper().write(
              key: SecureStorageKeys.verifyToken,
              value: verifyResponse.verifyToken,
            );

            emit(
              SignUpSuccessAndPhoneVerifyCodeSent(
                verifyPhoneResponseModel: verifyResponse,
              ),
            );
          },
          onError: (error) {
            emit(SignupFailure(error: error));
          },
        );
      },
      onError: (error) {
        emit(SignupFailure(error: error));
      },
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
