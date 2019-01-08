class ChangeDiscountPercentageToBeFloatInItems < ActiveRecord::Migration[5.2]
  def up
		change_column :items, :discount_percentage, :float
  end
	
	def down
		change_column :items, :discount_percentage, :integer
	end
end
