class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable,  :timeoutable and :omniauthable

  has_many :bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :authentication_keys => [:customer_nick]


  NICK_REGEX = /^[a-zA-Z0-9_\.]*$/
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates_presence_of :name, :surename, :phone_no, :email, :customer_nick, message: "To pole jest wymagane"
  validates_uniqueness_of :customer_nick, :message => "Nazwa użytkownika jest już zajęta", :case_sensitive => false

  validates :email, :format => {:with => EMAIL_REGEX, :message => "Podany adres email jest nieprawidłowy"}

  validates :customer_nick, :format => {:with => NICK_REGEX, :multiline => true, :message => "Wystąpiły niedozwolone znaki w nazwie użytkownika"}

  validates_uniqueness_of :email, :message => "Podany adres email jest używany"

  validates_numericality_of :phone_no, :message => "Proszę użyć tylko cyfr"

  devise :validatable
  #
  # validates :password,
  #           :length => {:in => 6..128, :message => "Proszę wpisać minimum 6 znaków"}, on: :new
  #
  validates :password, :confirmation => {:message => "Wpisane hasła NIE są identyczne"}, on: :new



end
