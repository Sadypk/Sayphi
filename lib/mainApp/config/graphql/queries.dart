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

  static const GET_ALL_ETHNICITY = r'''
query{
  getAllEthnicity{
    error
    msg
    data{
      _id
      ethnicity
    }
  }
}
  ''';
  static const GET_ALL_ETHNICITY_NAME = 'getAllEthnicity';

  static const GET_ALL_PROMPTS_NAME = 'getUserPrompts';
  static const GET_ALL_PROMPTS = r'''
query{
  getUserPrompts{
    error
    msg
    data{
      _id
      prompt
    }
  }
}
  ''';


  static const VERIFY_TOKEN = r'''
query($token: String){
  verifyUser(token : $token){
    error
    msg
    data{
      _id
      phone_or_email
      nick_name
      profile_image
      complete
      date_of_birth
    	images{
        image
        status
      }
      videos{
        video
        status
      }
      show_gender_in_profile
      ethnicity{
        _id
        ethnicity
      }
      
      gender{
        _id
        gender
      }
      filters{
        location {
          name
          coordinates{
            lat
            lng
          }
        }
        interest
        filter_by
        age_range{
          start
          end
        }
        language
        looking_for
        photo_verified
        height{
          start
          end
        }
        children{
          start
          end
        }
        smoking
        pets
        religion{
          _id
          ethnicity
        }
      }
    }
  }
}
''';
  static const VERIFY_TOKEN_NAME = 'verifyUser';
}