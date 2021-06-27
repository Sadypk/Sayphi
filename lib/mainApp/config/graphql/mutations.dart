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
    $ethnicityID: ID
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
    $religion: ID
    $password: String
){
  updateUser(
    userInput : {
      first_name: $firstname
      last_name: $lastname
      gender: $genderId
      show_gender_in_profile: $showGender
      date_of_birth: $dob
      nick_name: $nickName
      ethnicity: $ethnicityID
      profile_image: $profileImage
      complete: $isComplete
      password: $password
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
        religion: $religion
      }
    }
  ){
    error
    msg
  }
}
  ''';
}