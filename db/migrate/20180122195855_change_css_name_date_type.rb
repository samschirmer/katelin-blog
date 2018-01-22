class ChangeCssNameDateType < ActiveRecord::Migration[5.0]
  def change
		remove_column :stylesheets, :name, :integer
		add_column :stylesheets, :name, :string
  end
end
