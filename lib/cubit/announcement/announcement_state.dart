part of 'announcement_cubit.dart';

abstract class AnnouncementState extends Equatable {
  const AnnouncementState();

  @override
  List<Object> get props => [];
}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoading extends AnnouncementState {}

class AnnouncementValid extends AnnouncementState {
  final List<Pengumuman>? announcementModel;

  AnnouncementValid(this.announcementModel);
  @override
  List<Object> get props => [announcementModel!];
}

class AnnouncementInvalid extends AnnouncementState {
  final String? message;

  AnnouncementInvalid(this.message);
  @override
  List<Object> get props => [message!];
}
