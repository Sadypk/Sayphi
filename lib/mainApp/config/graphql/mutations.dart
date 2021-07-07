class GMutation{

  GMutation._();

  static const UPDATE_USER_NAME = 'updateUser';
  static const UPDATE_USER = r'''
  mutation(
    $firstname: String
    $lastname: String
    $genderId: ID
    $showGender: Boolean
    $dob: String
    $nickName: String
    $userEthnicityID: ID
    $profileImage: String
    $isComplete: Boolean
    $interestedIn: String
    $filterBy: String
    $ageRangeStart: Int
    $ageRangeEnd: Int
    $language: String
    $lookingFor: String
    $photoVerified: Boolean
    $heightStart: Int
    $heightEnd: Int
    $childrenStart: Int
    $childrenEnd: Int
    $smoking: Boolean
    $pets: Boolean
    $filterReligion: ID
    $password: String
    $userHeight: Int
    $userReligion: ID
    $filterEthnicity: ID
    $questionID: ID
    $questionAnswer: String
    $school: String
    $college: String
    $occupation: String
    $instaId: String
    $spotifyId: String
    $relationshipGoal: String
    $relationshipStatus: String
    $status: String
    $userLocaion: locationInput
    $filterLocation: locationInput
){
  updateUser(
    userInput : {
      first_name: $firstname
      last_name: $lastname
      password: $password
      gender: $genderId
      show_gender_in_profile: $showGender
      date_of_birth: $dob
      nick_name: $nickName
      ethnicity: $userEthnicityID
      religion: $userReligion
      height: $userHeight
      profile_image: $profileImage
      complete: $isComplete
      school: $school
      college: $college
      relationshipGoal: $relationshipGoal
      relationshipStatus: $relationshipStatus
      instagramID: $instaId
      spotifyID: $spotifyId
      occupation: $occupation
      status: $status
      address: $userLocaion
      question_answer:[{
        question: $questionID
        answer: $questionAnswer
      }]
      filters:{
        location: $filterLocation
        interest: $interestedIn
        filter_by: $filterBy
        age_range: {
          start: $ageRangeStart
          end: $ageRangeEnd
        }
        language: $language
        looking_for: $lookingFor
        photo_verified: $photoVerified
        height: {
          start: $heightStart
          end: $heightEnd
        }
        children: {
          start: $childrenStart
          end: $childrenEnd
        }
        smoking: $smoking
        pets: $pets
        religion: $filterReligion
        ethnicity: $filterEthnicity
      }
    }
  ){
    error
    msg
  }
}
  ''';

  static const USER_ADD_PROMPT_NAME = 'addUserPrompt';
  static const USER_ADD_PROMPT = r'''
  mutation($id: ID $answer: String){
  addUserPrompt(prompt: $id answer: $answer){
    error
    msg
  }
}
  ''';

  static const USER_UPDATE_PROMPT_NAME = 'updateUserPrompt';
  static const USER_UPDATE_PROMPT = r'''
  mutation($id: ID $answer: String){
  updateUserPrompt(prompt: $id answer: $answer){
    error
    msg
  }
}
  ''';

  static const USER_DELETE_PROMPT_NAME = 'deleteUserPrompt';
  static const USER_DELETE_PROMPT = r'''
mutation($id : ID){
  deleteUserPrompt(prompt : $id){
    error
    msg
  }
}
  ''';

  static const USER_ADD_IMAGE_NAME = 'addImageToUserProfile';
  static const USER_ADD_IMAGE = r'''
  mutation($link: String){
  addImageToUserProfile(image: $link){
    error
    msg
  }
}
  ''';

  static const CREATE_CHANNEL_NAME = 'createChannel';
  static const CREATE_CHANNEL = r'''
  mutation($channelName: String $isVideo: Boolean $isAudio: Boolean){
  createChannel(channelName: $channelName isVideoLive: $isVideo isAudioLive: $isAudio){
    error
    msg
    token
  }
}
  ''';

  static const USER_ADD_DAY_NAME = 'addDay';
  static const USER_ADD_DAY = r'''
  mutation($image: String){
  addDay(image: $image){
    error
    msg
  }
}
  ''';

  static const LIKE_USER_NAME = 'userLikeUnlike';
  static const LIKE_USER = r'''
  mutation($userId: ID){
  userLikeUnlike(_id: $userId){
    error
    msg
  }
}
  ''';

  static const FOLLOW_USER_NAME = 'userFollowUnfollow';
  static const FOLLOW_USER = r'''
  mutation($userId: ID){
  userFollowUnfollow(_id: $userId){
    error
    msg
  }
}
  ''';

  static const BLOCK_UNBLOCK_USER_NAME = 'userBlockUnblock';
  static const BLOCK_UNBLOCK_USER = r'''
  mutation($userID: ID){
  userBlockUnblock(_id: $userID){
    error
    msg
  }
}
  ''';

  static const VISIT_USER_NAME = 'userVisit';
  static const VISIT_USER = r'''
  mutation($userID: ID){
  userVisit(_id: $userID){
    error
    msg
  }
}
  ''';

  static const MATCH_UNMATCH_USER_NAME = 'addUserToMatchOrUnMatchList';
  static const MATCH_UNMATCH_USER = r'''
  mutation($userID: ID $match: Boolean){
  addUserToMatchOrUnMatchList(user_id: $userID match: $match){
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

  static const ADD_VIDEO_PROFILE_NAME ='addVideoToUserProfile';
  static const ADD_VIDEO_PROFILE = r'''
  mutation($videoLink: String){
  addVideoToUserProfile(video: $videoLink){
    error
    msg
  }
}
''';

  static const CLOSE_LIVE_NAME = 'closeLive';
  static const CLOSE_LIVE = r'''
  mutation($closeLiveAudio: Boolean $closeLiveVideo: Boolean){
  closeLive(isAudioLive: $closeLiveAudio isVideoLive: $closeLiveVideo){
    error
    msg
  }
}
  ''';
}