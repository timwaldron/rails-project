class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates_presence_of :username, :first_name, :last_name,
                        :street_number, :street_name, :suburb,
                        :city, :postcode

  validates_uniqueness_of :username
end
