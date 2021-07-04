class GQueries{

  GQueries._();


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

  static const GET_ALL_RELIGION = r'''
query{
  getAllReligion{
    error
    msg
    data{
      _id
      religion
    }
  }
}
  ''';
  static const GET_ALL_RELIGION_NAME = 'getAllReligion';

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
      question_answer{
        question{
          _id
          question
          answers
        }
        answer
      }
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
      religion{
        _id
        religion
      }
      gender{
        _id
        gender
      }
      occupation
      school
      college
      relationshipGoal
      relationshipStatus
      instagramID
      spotifyID
      status
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
}
''';

  static const GET_POLICY_NAME = 'getPolicy';
  static const GET_POLICY = r'''
  query($type: String){
  getPolicy(type: $type){
    error
    msg
    data{
      _id
      header
      footer
      policies{
        title
        description
      }
    }
  }
}
  ''';

  static const USER_GET_DAYS_NAME = 'getMyDays';
  static const USER_GET_DAYS = r'''
  query{
  getMyDays{
    error
    msg
    data{
      _id
      image
      createdAt
    }
  }
}
  ''';

  static const GET_ALL_DAYS_NAME = 'getFollowersWithDays';
  static const GET_ALL_DAYS = r'''
  query{
  getFollowersWithDays{
    error
    msg
    data{
      _id
      nick_name
      profile_image
      days{
        _id
        image
        createdAt
      }
    }
  }
}
  ''';

  static const USER_FOLLOWERS_NAME = 'getUserFollowers';
  static const USER_FOLLOWERS = r'''
  query{
  getUserFollowers{
    error
    msg
    data{
      _id
      nick_name
      profile_image
    }
  }
}
  ''';

  static const USER_FOLLOWING_NAME = 'getUserFollows';
  static const USER_FOLLOWING = r'''
  query{
  getUserFollows{
    error
    msg
    data{
      _id
      nick_name
      profile_image
    }
  }
}
  ''';

  static const USER_LIKES_NAME = 'getUserLikes';
  static const USER_LIKES = r'''
  query{
  getUserLikes{
    error
    msg
    data{
      _id
      nick_name
      profile_image
    }
  }
}
  ''';

  static const USER_LIKERS_NAME = 'getUserLikers';
  static const USER_LIKERS = r'''
  query{
  getUserLikers{
    error
    msg
    data{
      _id
      nick_name
      profile_image
    }
  }
}
  ''';


  static const GET_LIVE_VIDEO_USERS_NAME = 'getLiveVideos';
  static const GET_LIVE_VIDEO_USERS = r'''
  query{
  getLiveVideos{
    error
    msg
    data{
      _id
      nick_name
      profile_image
      channel_name
    }
  }
}
  ''';
  static const GET_LIVE_AUDIO_USERS_NAME = 'getLiveAudios';
  static const GET_LIVE_AUDIO_USERS = r'''
  query{
  getLiveAudios{
    error
    msg
    data{
      _id
      nick_name
      profile_image
      channel_name
    }
  }
}
  ''';
}