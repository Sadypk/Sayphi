class GQueries{
  static const LOGIN_WITH_EMAIL_OR_NUMBER_AND_PASSWORD_NAME =  'userLogin';
  static const LOGIN_WITH_EMAIL_OR_NUMBER_AND_PASSWORD = r'''
      query($data: String $password: String){
      userLogin(
        phone_or_email: $data
        password: $password
      ){
        token
        error
        msg
      }
    }
  ''';


  static const GET_ALL_GENDERS = r'''
  query{
  getAllGender{
    error
    msg
    data{
      _id
      gender
    }
  }
}
  ''';
  static const GET_ALL_GENDERS_NAME = 'getAllGender';
}