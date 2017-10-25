class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :company
  belongs_to :manager, :class_name => "User", :foreign_key => "manager_id"
  has_many :subordinates,:class_name=>"User",:foreign_key=>"manager_id"
  has_many :user_locations
  has_many :locations,through: :user_locations
  has_many :invoices, :dependent => :destroy
  has_many :orders, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable
end
