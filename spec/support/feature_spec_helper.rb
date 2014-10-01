module FeatureSpecHelper

  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = {
      "provider" => "facebook",
      "uid" => "12345",
      "user_info" => {
        "name" => "facebook user"
      }
    }
  end
end
