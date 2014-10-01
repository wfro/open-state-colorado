class User < ActiveRecord::Base
  # def self.find_or_create_by_auth(auth_data)
  #   user = User.find_or_create_by_provider_and_uid(auth_data["provider"], auth_data["uid"])

  #   if user.name != auth_data["user_info"]
  #     user.name = auth_data["user_info"]["name"]
  #     user.save
  #   end

  #   return user
  # end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
      end
    end
  end
end
