class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates_presence_of :username, :first_name, :last_name,
                        :street_number, :street_name, :suburb,
                        :city, :postcode, :state, :date_of_birth
  validates_uniqueness_of :username

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
