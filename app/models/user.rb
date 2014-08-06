class User < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :omniauthable

  def self.find_or_create_for_google_oauth2(data)
    params = { email: data["email"] }
    User.where(params).first || User.create!(
      email: data['email'],
      first_name: data['first_name'],
      last_name: data['last_name'],
      picture: data['image']
    )
  end
end
