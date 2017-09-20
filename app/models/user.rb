class User < ApplicationRecord

  acts_as_token_authenticatable

  before_create :generate_code

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_uniqueness_of :code

  private

  def generate_code
    letter = ("a".."z")
    number = (0..9)
    up_letter = ("A".."Z")
    cadena = letter.to_a + number.to_a + up_letter.to_a
    key = cadena.shuffle[0,16].join

    self.code = key
  end

end
