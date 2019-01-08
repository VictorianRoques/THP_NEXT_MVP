# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
  	before_action :find_item, only: [:edit, :update]
		def index
			@items = Item.all
		end
		def edit; end
		
    def update
			if @item.update(item_params)
				flash[:notice] = "L'item a été modifié avec succès"
      	redirect_to administration_items_path
				if @item.discount_percentage.positive?
					@item.update(has_discount: true)
				else
					@item.update(has_discount: false)
				end
			else
				flash[:alert] = "Erreur, entrez un nombre entre 0 et 100"
      	redirect_to administration_items_path
			end
    end

		private

		def item_params
			params.require(:item).permit(:original_price, :has_discount, :discount_percentage)
		end

		def find_item
			@item = Item.find(params[:id])
		end
	end
end
