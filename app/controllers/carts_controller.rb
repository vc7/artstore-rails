class CartsController < ApplicationController

	# 在 checkout 的時候才需要登入 
	before_action :authenticate_user!, only: [:checkout]

	def index
		@cart = current_cart
	end

	def checkout
		@order = current_user.orders.build
		@info = @order.build_info
	end
end
