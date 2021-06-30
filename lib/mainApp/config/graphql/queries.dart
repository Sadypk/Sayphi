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

  static const LOGIN_WITH_ID_TOKEN_NAME = 'userLoginWithIdToken';
  static const LOGIN_WITH_ID_TOKEN = r'''
  query($idToken: String){
  userLoginWithIdToken(idToken: $idToken){
    error
    msg
    token
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

  static const GET_ALL_USER_PROMPTS_NAME = 'getUserPrompts';
  static const GET_ALL_USER_PROMPTS = r'''
query{
  getUserPrompts{
    error
    msg
    data{
      prompt{
        _id
        prompt
      }
      answer
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
      height
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
          religion
        }
      }
    }
  }
}
''';
  static const VERIFY_TOKEN_NAME = 'verifyUser';

  static const GET_ALL_QUESTIONS_NAME = 'getAllQuestion';
  static const GET_ALL_QUESTIONS = r'''
  query{
  getAllQuestion{
    error
    msg
    data{
      _id
      question
      answers
    }
  }
}
  ''';

  static const GET_ALL_PROMPTS_NAME = 'getAllPrompt';
  static const GET_ALL_PROMPTS = r'''
  query{
  getAllPrompt{
    error
    msg
    data{
      _id
      prompt
    }
  }
}''';
}