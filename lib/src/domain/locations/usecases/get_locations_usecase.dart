part of '../locations.dart';

class GetLocationsUseCase {
  final LocationsRepository repository;

  GetLocationsUseCase({required this.repository});

  Future<LocationsEntity> call(int page) {
    return repository.getLocationsPerPage(page);
  }
}
