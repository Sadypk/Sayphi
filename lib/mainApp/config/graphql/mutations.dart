class GMutation{
  static const String UPDATE_USER_NAME = 'updateUser';
  static const String UPDATE_USER = r'''
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
    $locationName: String
    $latitude: Float
    $longitude: Float
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
      question_answer:[{
        question: $questionID
        answer: $questionAnswer
      }]
      filters:{
        location: {
          name: $locationName
          coordinates: {
            lat: $latitude
            lng: $longitude
          }
        }
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
  mutation($channelName: String){
  createChannel(channelName: $channelName){
    error
    msg
    token
  }
}
  ''';
}