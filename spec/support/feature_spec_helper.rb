module FeatureSpecHelper

  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      "provider" => "facebook",
      "uid" => "12345",
      "info" => {
        "name" => "facebook user"
      }
    })
  end

  def mock_json_response
    '{
      "first_name": "Anita",
      "last_name": "Bonds",
      "middle_name": "",
      "district": "At-Large",
      "chamber": "upper",
      "url": "http://dccouncil.us/council/anita-bonds",
      "created_at": "2013-01-07 21:05:06",
      "updated_at": "2013-03-26 03:22:24",
      "email": "abonds@dccouncil.us",
      "active": true,
      "state": "dc",
      "offices": [
       {
        "fax": "(202) 724-8099",
        "name": "Council Office",
        "phone": "(202) 724-8064",
        "address": "1350 Pennsylvania Avenue NW, Suite 408, Washington, DC 20004",
        "type": "capitol",
        "email": null
       }
      ],
      "full_name": "Anita Bonds",
      "leg_id": "DCL000021",
      "party": "Democratic",
      "suffixes": "",
      "id": "DCL000021",
      "photo_url": "http://dccouncil.us/files/user_uploads/member_photos/AAA_small.jpg"
     }'
  end
end
