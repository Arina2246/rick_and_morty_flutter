import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core_ui/core_ui.dart';
import 'package:rick_and_morty/src/data/location/location.dart';
import 'package:rick_and_morty/src/domain/location/location.dart';
import 'package:rick_and_morty/src/ui/location/bloc/location_bloc.dart';
import 'package:rick_and_morty/src/ui/location/widgets/location_content.dart';

class LocationScreen extends StatelessWidget {
  final String id;

  const LocationScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const LocationDI().setup(),
      builder: (context, _) {
        return BlocProvider<LocationBloc>(
          create: (_) => LocationBloc(
            getLocationUseCase: Provider.of<GetLocationUseCase>(context),
          )..add(
              LocationLoadEvent(id),
            ),
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (BuildContext context, LocationState state) {
              if (state is Loading) {
                return const LoadingWidget();
              } else if (state is Error) {
                return CustomErrorWidget(onTap: () => refresh(context));
              } else if (state is Success) {
                return LocationContent(
                  location: state.location,
                );
              } else {
                return CustomErrorWidget(onTap: () => refresh(context));
              }
            },
          ),
        );
      },
    );
  }

  Future refresh(BuildContext context) async {
    context.read<LocationBloc>().add(
          LocationLoadEvent(id),
        );
  }
}
