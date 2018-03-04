class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:admin_nick]



   NICK_REGEX = /^[a-zA-Z0-9_\.]*$/
   EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

   validates_presence_of :name, :surename, :email, :admin_nick, message: "To pole jest wymagane"
   validates_uniqueness_of :admin_nick, :message => "Nazwa użytkownika jest już zajęta", :case_sensitive => false
   validates_uniqueness_of :email, :message => "Podany adres email jest już wykorzystany"

   validates :email, :format => {:with => EMAIL_REGEX, :message => "Podany adres email jest nieprawidłowy"}
   validates :admin_nick, :format => {:with => NICK_REGEX, :multiline => true, :message => "Wystąpiły niedozwolone znaki w nazwie użytkownika"}

   validates :password,
             :length => {:minimum => 6, :maximum => 128, :message => "Proszę wpisać minimum 6 znaków"}, on: :new

   validates :password, :confirmation => {:message => "Wpisane hasła NIE są identyczne"}, on: :new
             # :if => lambda{ |customer| customer.password_confirmation.present? }

   devise :validatable

end
