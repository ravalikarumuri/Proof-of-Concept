class Item < ActiveRecord::Base
  #has_many :orders,dependent: :destroy
  belongs_to :order
end
