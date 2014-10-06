class User < ActiveRecord::Base
  validates :district, format: { with: /\A[1-5][0-9]?\z|\A[6][0-5]?\z/ }

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
