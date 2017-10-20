class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  enum role: [:normal, :admin]

  has_many :ratings
  has_many :games, through: :ratings

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
   end

   def purchase_game(game)
     binding.pry
     if self.money >= game.price
       self.money -= game.price
       self.games << game
       self.save
     else
       "You don't have enough money to purchase #{game.name}!"
     end
   end

end
