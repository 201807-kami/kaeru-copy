class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        
  


  has_many :favorites
  has_many :carts
  has_many :orders
  

  validates :first_name, presence: true
  validates :first_name_furigana, presence: true
  validates :last_name, presence: true
  validates :last_name_furigana, presence: true
  validates :address, presence: true
  #validates :zip, presence: true, format: {with: /\A\d{7}$\z/}
  #validates :tel, presence: true, format: {with: /\A[0-9-]{,14}\z/}

end
