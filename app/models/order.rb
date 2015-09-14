class Order < ActiveRecord::Base
	belongs_to :user

	has_one :info, class_name: "OrderInfo", dependent: :destroy

	accept_nested_attributes_for :info
end
