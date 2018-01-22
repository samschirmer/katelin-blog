class AddOrderToStylesheets < ActiveRecord::Migration[5.0]
  def change
		add_column :stylesheets, :order, :integer
  end
end
