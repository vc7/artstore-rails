class ProductsController < ApplicationController
	def index
		@products = Product.order("id DESC")
	end

	def show
		@product = Product.find(params[:id])
	end

	def add_to_cart
		@product = Product.find(params[:id])

		# 要判斷購物車裡面有沒有這項物品，才看是否需要加入
		if !current_cart.items.include?(@product)
			current_cart.add_product_to_cart(@product)
			flash[:notice] = "你已經成功把 #{@product.title} 加入購物車"
		else
			flash[:warning] = "你的購物車已經有此商品"
		end

		redirect_to :back
	end
end
