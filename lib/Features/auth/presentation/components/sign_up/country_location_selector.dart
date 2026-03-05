import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/Features/auth/domain/repo/auth_repo.dart';
import 'package:quent/Features/auth/presentation/cubits/signup/signup_cubit.dart';
import 'package:quent/injector.dart';
import 'package:quent/core/models/country_model.dart';
import 'package:quent/core/models/location_model.dart';
import 'package:quent/core/resources/app_sizes.dart';
import 'package:quent/core/utils/country_code_to_flag.dart';
import 'package:quent/core/utils/form_validators.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/cubit/paginated_dropdown_cubit.dart';
import 'package:quent/core/widgets/paginated_search_dropdown/paginated_search_dropdown.dart';
import 'package:quent/generated/l10n.dart';

class CountryLocationSelector extends StatefulWidget {
  const CountryLocationSelector({super.key});

  @override
  State<CountryLocationSelector> createState() =>
      _CountryLocationSelectorState();
}

class _CountryLocationSelectorState extends State<CountryLocationSelector> {
  late final PaginatedDropdownCubit<CountryModel> _countryCubit;
  late final PaginatedDropdownCubit<LocationModel> _locationCubit;

  @override
  void initState() {
    super.initState();
    _countryCubit = PaginatedDropdownCubit<CountryModel>(
      fetchData: sl<AuthRepo>().fetchCountries,
    );
    _locationCubit = PaginatedDropdownCubit<LocationModel>(
      fetchData: sl<AuthRepo>().fetchLocations,
    );
  }

  @override
  void dispose() {
    _countryCubit.close();
    _locationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Row(
      spacing: AppSizes.h16,
      children: [
        Expanded(
          child: PaginatedSearchDropdown<CountryModel>(
            controller: cubit.countryController,
            validator: (value) => FormValidators.requiredField(
              value,
              S.of(context).countryRequired,
            ),
            hintText: S.of(context).selectCountry,
            cubit: _countryCubit,
            itemAsString: (country) => country.country,
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                leading: Text(
                  countryCodeToFlag(item.abbreviation),
                  style: TextStyle(fontSize: 30),
                ),
                title: Text(
                  item.country,
                  style: TextTheme.of(context).titleMedium,
                ),
                trailing: isSelected ? const Icon(Icons.check) : null,
              );
            },
            onSelecte: (country) {
              context.read<SignupCubit>().selectCountry(country);
            },
          ),
        ),
        Expanded(
          child: PaginatedSearchDropdown<LocationModel>(
            controller: cubit.locationController,
            validator: (value) => FormValidators.requiredField(
              value,
              S.of(context).locationRequired,
            ),
            hintText: S.of(context).selectLocation,
            cubit: _locationCubit,
            itemAsString: (location) => location.name,
            onSelecte: (location) {
              context.read<SignupCubit>().selectLocation(location);
            },
          ),
        ),
      ],
    );
  }
}
