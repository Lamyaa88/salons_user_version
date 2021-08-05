abstract class ContactUsStates {}

class ContactUsInitialState  extends ContactUsStates{}

class ContactUsLoadingState extends ContactUsStates{}

class ContactUsGetSuccessState extends ContactUsStates{}

class ContactUsGetErrorState extends ContactUsStates{
  final String error;
  ContactUsGetErrorState({this.error});
}