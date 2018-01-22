class AddNameToStylesheets < ActiveRecord::Migration[5.0]
  def change
		add_column :stylesheets, :name, :integer
  end
end
