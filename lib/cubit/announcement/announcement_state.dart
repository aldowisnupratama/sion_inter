part of 'announcement_cubit.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();

  @override
  List<Object> get props => [];
}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoading extends AnnouncementState {}

class AnnouncementValid extends AnnouncementState {}

class AnnouncementInvalid extends AnnouncementState {}
